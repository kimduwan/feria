package com.intime.feria.service;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.intime.feria.dao.FriendsDAO;
import com.intime.feria.dao.RequestsDAO;
import com.intime.feria.dao.UsersDAO;
import com.intime.feria.util.PaginateUtil;
import com.intime.feria.vo.Friend;
import com.intime.feria.vo.PageVO;
import com.intime.feria.vo.Request;
import com.intime.feria.vo.User;

/* 2020-08-07 장유정(기본세팅) 2 */
@Service
public class FriendServiceImpl implements FriendService {

	private FriendsDAO friendsDAO;
	private RequestsDAO requestsDAO;
	private UsersDAO usersDAO;// 0809 정예찬

	public void setFriendsDAO(FriendsDAO friendsDAO) {
		this.friendsDAO = friendsDAO;
	}

	public void setRequestsDAO(RequestsDAO requestsDAO) {
		this.requestsDAO = requestsDAO;
	}

	public void setUsersDAO(UsersDAO usersDAO) {// 0809 정예찬
		this.usersDAO = usersDAO;
	}

	// 0809 정예찬 친구요청
	@Override
	public void request(String email, PrintWriter out, HttpServletRequest req, HttpServletResponse resp) {

		// 해당 email을 가진 User의 no를 userNo에 저장
		int userNo = usersDAO.selectOne(email);

		// throws Exception대신 try ~ catch사용
		try {
			// PrintWriter 객체 out 생성
			out = resp.getWriter();
		} catch (Exception e) {
			e.printStackTrace();
		}

		User loginMember = (User) req.getSession().getAttribute("loginUser");
		int memberNo = loginMember.getNo();

		// 이전 페이지를 기억하는 referer 생성
		String referer = req.getHeader("referer");

		// print memberNo(로그인 한 사람 no), userNo(요청 수신자 User의 no)
		// System.out.println("신청자 번호: " + memberNo);
		// System.out.println("신청대상: " + userNo);

		// memberNo, userNo를 가진 Friend 객체
		Friend friend = new Friend(memberNo, userNo);

		// memberNo, userNo를 가진 Request 객체
		Request ckRequest = new Request(memberNo, userNo);

		// requests 테이블에서 요청 여부(req_state)를 가져와서 String 형태로 저장
		String request = requestsDAO.checkRequest(ckRequest);

		// 본인 이메일로 신청한게 아닐 때
		if (memberNo != userNo) {
			// friends 테이블에 없을 때(친구가 아닌 상태이거나 요청 처리 대기중)
			if (friendsDAO.checkFriend(friend) == null) {

				// friends 테이블에 없고 request 테이블에 없거나, Y, N일 때
				// request == null : 신청한 적 X
				// request.equals("Y") : 친구가 되었으나 둘 중 누군가 삭제, 재신청
				// request.equals("N") : 친구신청 거절당해서 ㅜ_ㅜ 다시 신청
				if (request == null || request.equals("Y") || request.equals("N")) {

					// Request requester = new Request(70, memberNo, userNo);
					// System.out.println("실행됨");
					requestsDAO.insert(ckRequest);

					// 컨트롤러의 리다이렉트를 이곳 if문에 넣으면 될수도
					// 서비스에서 처리하지말고 컨트롤러에서 처리해야할듯 이 메서드 내용물 전부
					try {
						resp.sendRedirect(referer);
					} catch (Exception e) {
						e.printStackTrace();
					}

				} else { // friends 테이블에 없고 request 테이블에 있을 때 (요청 대기중)

					// System.out.println("이미 요청되어있음");
					// System.out.println("실행안됨");
					out.println(
							"<script>alert('요청 응답 대기중인 친구입니다.'); location.href='/friend_management.feria';</script>");
					out.close();
				}
			} else { // friends 테이블에 있을 때 (친구일 때)

				// System.out.println("이미 친구임");
				// System.out.println("실행안됨");
				out.println("<script>alert('이미 친구입니다.'); location.href='/friend_management.feria';</script>");
				out.close();
			}
		} else { // 본인에게 신청했을 때
			// System.out.println("본인입니다!");
			// System.out.println("실행안됨");
			out.println("<script>alert('본인입니다.'); location.href='/friend_management.feria';</script>");
			out.close();
		}

	}

	// 0809 정예찬 친구요청 목록
	@Override
	public Map<String, Object> getRequestList(int pageNo, int memberNo) {

		// 한 페이지에 보여줄 li 수
		int numPage = 4;

		// PageVO 객체 생성
		PageVO pageVO = new PageVO(pageNo, numPage, memberNo);

		// 요청받은 목록을 저장하는 fReqList
		List<Request> fReqList = requestsDAO.selectRequestList(pageVO);

		// 로그인 한 본인이 가지고있는 요청 수 total에 저장
		int total = requestsDAO.selectTotal(memberNo);

		// System.out.println(pageNo);
		// System.out.println(memberNo);
		// System.out.println(total);

		// < 1 2 3 > 형태 #### ex) numBlock = 4; -> < 1 2 3 4 >
		int numBlock = 3;

		// pageURL 설정
		String url = "/mypage.jsp";
		String param = "reqPage=";

		// request의 Paging처리 객체 생성
		String reqPaginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);

		// Map 객체 생성
		Map<String, Object> reqMap = new ConcurrentHashMap<String, Object>();

		// reqMap에 fReqList, reqPaginate, total 넣어줌
		reqMap.put("fReqList", fReqList);
		reqMap.put("reqPaginate", reqPaginate);
		reqMap.put("total", total);

		return reqMap;
	}

	// 0809 정예찬 친구목록
	@Override
	public Map<String, Object> getFriendList(int pageNo, int memberNo) {

		// 한 페이지에 보여줄 li 수
		int numPage = 4;

		// PageVO 객체 생성
		PageVO pageVO = new PageVO(pageNo, numPage, memberNo);

		// 요청받은 목록을 저장하는 fReqList
		List<Friend> fRegList = friendsDAO.selectFriendList(pageVO);

		// 로그인 한 본인이 가지고있는 요청 수 total에 저장
		int total = requestsDAO.selectTotal(memberNo);

		// System.out.println(pageNo);
		// System.out.println(memberNo);
		// System.out.println(total);

		// < 1 2 3 > 형태 #### ex) numBlock = 4; -> < 1 2 3 4 >
		int numBlock = 3;

		// pageURL 설정
		String url = "/mypage.jsp";
		String param = "regPage=";

		// request의 Paging처리 객체 생성
		String regPaginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);

		// Map 객체 생성
		Map<String, Object> regMap = new ConcurrentHashMap<String, Object>();

		// reqMap에 fReqList, reqPaginate, total 넣어줌
		regMap.put("fRegList", fRegList);
		regMap.put("regPaginate", regPaginate);
		regMap.put("total", total);

		return regMap;
	}

	@Override
	public List<Friend> prtcFriendList(int no) {
		return friendsDAO.friendList(no);
	}
}
