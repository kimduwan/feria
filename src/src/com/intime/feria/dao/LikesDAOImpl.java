package com.intime.feria.dao;

import org.apache.ibatis.session.SqlSession;

import com.intime.feria.vo.Like;

public class LikesDAOImpl implements LikesDAO {
	
	/* 2020-08-07 장유정(기본세팅) */
	// 멤버필드
	private SqlSession session;
	
	// setter
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	/* 2020.08.13 조현득 */
	//0811 정예찬 좋아요 갯수
		@Override
		public int selectLikeCount(Like count) {
			return session.selectOne("likes.selectLikeCount", count);
		}
		
		//0811 정예찬 좋아요 클릭한 유저
		@Override
		public int selectUserLike(Like like) {
			return session.selectOne("likes.selectUserLike", like);
		}
		
		//0811 정예찬 좋아요 취소
		@Override
		public int delete(Like like) {
			return session.delete("likes.delete", like);
		}
		
		//0811 정예찬 좋아요 체크
		@Override
		public int insert(Like like) {
			return session.insert("likes.insert", like);
		}
}
