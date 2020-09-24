package com.intime.feria.dao;

import com.intime.feria.vo.Like;

/* 2020-08-07 장유정(기본세팅) */
public interface LikesDAO {

	//0811 정예찬 좋아요 갯수
		public int selectLikeCount(Like count);
		
		//0811 정예찬 좋아요 클릭한 유저
		public int selectUserLike(Like like);
		
		//0811 정예찬 좋아요 취소
		public int delete(Like like);
		
		//0811 정예찬 좋아요 체크
		public int insert(Like like);
	
}
