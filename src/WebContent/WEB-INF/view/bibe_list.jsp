<%@page import="com.intime.feria.dao.BibesDAO"%>
<%@page import="com.intime.feria.vo.Bibe"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 2020.08.07. Kelly -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Feria | 비베 리스트</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- mypage.css -->
<link rel="stylesheet" href="css/mypage.css">
<c:import url="/WEB-INF/template/link.jsp"></c:import>

<style>
body {
	font-family: "Noto Sans KR", sans-serif;
	color: #222;
}

#wrapBibeList {
	width: 1000px;
	margin: auto;
}

#wrapBibeList .bibe_header {
	margin-top: 50px;
	text-align: center;
}

#wrapBibeList .bibe_header h2 {
	font-size: 36px;
	font-weight: 600;
	padding: 10px 0 5px 0;
}

#wrapBibeList .bibe_header h3 {
	font-size: 24px;
	padding: 10px 0;
	border-bottom: 1px solid #424242;
}

.bibe_list {
	margin: auto;
	display: inline-block;
	width: 1000px;
}
.bibe_list a {
	color:#424242;
	text-decoration: none;
}

.bibe_list h3 {
	margin: 0 0 20px 120px;
	font-size: 16px;
}

.flag_legend {
	margin: 30px 0;
}

.flag_legend h3 {
	margin-bottom: 10px;
}

/*상단 설명부 및 헤더*/
.bibe_list ul {
	height: 100px;
}

/*비베 리스트들*/
.bibe_list ul li {
	margin: 0 10px 10px 0;
	height: 120px;
	width: 485px;
	border: 1px solid #424242;
	position: relative;
	float: left;
	overflow: hidden;
}

.bibe_list ul li a {
	display: block;
	margin: 0 10px 10px 0;
	height: 122px;
	width: 487px;
	position: relative;
	float: left;
}
/* 0731 bibe이미지 css 바꿈 */
.bibe_list ul li .wrap_bibe_item_img {
	position: absolute;
	width: 120px;
	height: 120px;
	border-right: 1px solid #424242;
}

.bibe_list img {
	display: block;
	height: 110px;
	margin: auto;
}
/* 0731 end */
.bibe_list ul li .wrap_tag {
	width: 320px;
	height: 70px; /*얘 왜 높이 고정 안되냐*/
}

.bibe_list ul li .bibe_name {
	position: absolute;
	left: 130px;
	top: 15px;
	font-size: 18px;
}
/*칵테일용*/
.bibe_list ul li .bibe_ingredient {
	position: relative;
	float: left;
	left: 130px;
	top: 45px;
	font-size: 16px;
	height: 30px;
	line-height: 1.8;
	border: 1px solid rgb(34, 34, 34);
	border-radius: 25px;
	padding: 0 15px 0 15px;
	margin-right: 10px;
	margin-bottom: 5px;
}
/*기성주류용*/
.bibe_list ul li .bibe_info {
	position: relative;
	display: block;
	left: 130px;
	top: 40px;
	font-size: 14px;
	width: auto;
	line-height: 1.4;
}

#gestTab3 {
	border-bottom: 2px solid rgb(34, 34, 34);
}

#btn2 {
	background-color: #fff;
	color: #e65100;
	border: 1px solid #e65100;
	border-radius: 3px;
}

.bibe_item_link {
	text-decoration: none;
	color: none;
}
</style>
</head>
<body>
	<c:import url="/mypageHeader.feria"></c:import>
	<c:import url="/WEB-INF/template/guestHeader.jsp"></c:import>
	<div id="wrapBibeList">
		<!--bibe_header -->
		<div class="bibe_header">
			<h2>비베 리스트</h2>
			<h3>저장된 Bibe를 관리해보세요.</h3>
		</div>
		<!--bibe_header 끝-->
		<div class="flag_legend"></div>

		<!--bibe_list-->
		<div class="bibe_list">
			<ul>
				<!--칵테일과 기성주류는 나중에 for문돌릴때 if문으로 구분-->
				<c:forEach items="${bibes }" var="bibe">


					<c:choose>
						<c:when test="${bibe.bTypeNo != 5 }">

							<li><a href="/bibe_detail.jsp?bibeNo=${bibe.bibeNo}">
									<div class="wrap_bibe_item_img">
										<img src="img/${bibe.bibeImg}" class="bibe_item_link" />
									</div> <span class="bibe_name">${bibe.bibeName}</span> <span
									class="bibe_info">용량 ${bibe.bibeMl}</span> <span
									class="bibe_info">가격 ${bibe.bibePrice}</span> <span
									class="bibe_info">도수 ${bibe.bibeAvb}</span> <span
									class="bibe_info">제조사 ${bibe.bibeBrand}</span>
							</a></li>

						</c:when>
						<c:otherwise>

							<!-- 칵테일 -->
							<li><a href="/bibe_detail.jsp?bibeNo=${bibe.bibeNo}">
									<div class="wrap_bibe_item_img">
										<img src="img/${bibe.bibeImg}" />
									</div> <span class="bibe_name">${bibe.bibeName }</span> <c:forEach
										items="${cocktails }" var="cocktail">

										<span class="bibe_ingredient">#${cocktail.bibeName }</span>

									</c:forEach>

							</a></li>


						</c:otherwise>
					</c:choose>

				</c:forEach>
			</ul>
		</div>
		<!--bibe_list 끝-->

	</div>
	<!--wrapbibe-->
	<c:import url="/WEB-INF/template/footer.jsp"></c:import>
</body>
</html>