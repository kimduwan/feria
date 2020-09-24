<%@page import="com.intime.feria.dao.PHeadsDAO"%>
<%@page import="com.intime.feria.dao.FImagesDAO"%>
<%@page import="com.intime.feria.dao.FDatesDAO"%>
<%@page import="com.intime.feria.vo.FDate"%>
<%@page import="com.intime.feria.vo.PageVO"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.intime.feria.dao.FeriasDAO"%>
<%@page import="com.intime.feria.vo.Feria"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//현재 페이지 번호
	int pageNo = 1;
	
	String pageNoStr = request.getParameter("page");
	
	pageNo = Integer.parseInt(pageNoStr);
	
	//한 페이지에 보여지는 게시물수
	int numPage = 6;

	PageVO pageVO = new PageVO(pageNo,numPage);

	List<FDate> fDates = FDatesDAO.selectList(pageVO);
	
	
	for(FDate fDate:fDates) {
		int no = fDate.getfDateNo();
		fDate.setfImages(FImagesDAO.selectList(no));
		fDate.setpHeads(PHeadsDAO.selectList(no));
	}
	

	ObjectMapper om = new ObjectMapper();

	String json = om.writeValueAsString(fDates);
	
%>
<%=json%>
