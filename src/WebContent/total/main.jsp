<%@page import="com.intime.feria.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Feria | Main</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<!--  외부 feria.css  -->
<!-- feria css명을 feira_card로 변경 2020.08.07 이원희 -->
<link rel="stylesheet" href="/css/feria_card.css" />
<link rel="stylesheet" href="/css/tui-date-picker.css">
<link rel="stylesheet" href="/css/toggle.css">

<style>
#wrapMain {
	width: 1200px;
	margin: auto;
}

.join_faria {
	width: 1160px;
	height: 500px;
	margin-left: 15px;
}

.join_faria img {
	width: 1160px;
	height: 500px;
	position: absolute;
}

.join_faria .join_box {
	position: relative;
	left: 700px;
	top: 110px;
	width: 370px;
	height: 240px;
	padding: 20px;
	background-color: white;
	border: 1px solid black;
}

.join_faria .btn_faria_join {
	width: 370px;
	height: 40px;
	border-radius: 5px;
	border: none;
	font-size: 16px;
	font-weight: bold;
	background-color: #9e9e9e;
	margin-left: 1px;
}

.join_faria .select_date .tui-datepicker-input {
	width: 370px;
	margin-bottom: 10px;
}
/* calendar css update 20-08-09 조현득*/
	.tui-datepicker{
		width: 370px;
		height: 358px;
		border: 1px solid #aaa;
	}
	.tui-calendar-container{
		width: 368px;
	}
	.tui-calendar{
		width: 368px;
	}
    .tui-datepicker .tui-is-selectable.tui-is-selected, .tui-datepicker.tui-rangepicker .tui-is-selectable.tui-is-selected {
    	background-color: #e65100;
    }
    .tui-datepicker .tui-is-selectable:hover {
    	background-color: #e57b42;
        color: white;
    }
    .tui-calendar-body-header tr{
    	line-height: 38.667px;
    }
    .tui-calendar-week{
    	line-height: 38.667px;
    }

.faria_list1 {
	width: 1200px;
}
.faria_list1 h2{
	text-indent: 15px;
	font-size: 36px;
	margin-top: 50px;
}

h1 {
	font-size: 40px;
	line-height: 1.2;
}

h2 {
	padding-left: 20px;
	padding-top: 20px;
	padding-bottom: 10px;
	border-bottom: 2px solid #7b8184;
	font-size: 36px;
}
.join_box h1{
	font-size: 20px;
	margin-bottom: 5px;
	margin-top: 15px;
}
.join_box  h2 {
	font-size: 20px;
	padding-left: 0px;
	border-bottom: none;
	margin-bottom: 10px;
	margin-top: 15px;
}

.faria_list2 {
	clear: both;
	width: 1200px;
}

.faria_list2 h2{
	font-size: 28px;
	margin: 0 0 30px 15px;
	padding-top: 25px;
	margin-bottom: 15px;
}

.faria_bibe {
	clear: both;
	width: 1200px;
}

.faria_bibe h2 {
	font-size: 28px;
	margin: 15px 0 15px 15px;
	padding-top: 15px;
}
/*비베*/
.wrap_list_bibe {
	width: 1170px;
	min-height: 300px;
	position: relative;
	margin-left: 15px;
	overflow: hidden;
}
.list_bibe{
	margin-left: 0px;
}
.list_bibe li {
	width: 280px;
	height: 280px;
	margin-bottom: 10px;
	margin-right: 9px;
	position: relative;
	border: 1px solid #9e9e9e;
	float: left;
}

.list_bibe li h4 {
	
}

.list_bibe li a {
	display: inline-block;
	width: 280px;
	height: 280px;
	cursor: pointer;
	position: absolute;
	left: 0;
	top: 0;
	z-index: 5;
}

.list_bibe li .img_bibe {
	display: block;
	width: 280px;
	height: 280px;
	margin: auto;
}

.list_bibe li:hover .img_bibe {
	display: none;
	height: 280px;
	margin: auto;
}

.list_bibe li h4 {
	position: absolute;
	left: 5px;
	top: 5px;
	font-size: 20px;
	color: #fff;
	font-weight: 700;
	text-shadow: 0 0 2px #222222;
	background-color: inherit;
}

.list_bibe li .num {
	position: absolute;
	right: 5px;
	top: 5px;
	font-size: 16px;
	color: #eee;
	background-color: #424242;
}

.list_bibe .king {
	position: absolute;
	left: 10px;
	bottom: 10px;
	width: 30px;
	height: 30px;
	border-radius: 20px;
	background-color: inherit;
}

.list_bibe .king_name {
	position: absolute;
	font-size: 16px;
	left: 50px;
	bottom: 17px;
	color: #eee;
	background-color: inherit;
}

.list_bibe .bg_full_star {
	position: absolute;
	right: 5px;
	bottom: 15px;
	font-size: 16px;
	color: #eee;
	background-image: url("img/bg_star.png");
	width: 110px;
	height: 17px;
	background-position: 0 -20px;
	z-index: 1;
	background-color: inherit;
}

.list_bibe .bg_void_star {
	position: absolute;
	right: 5px;
	bottom: 15px;
	font-size: 16px;
	color: #eee;
	background-image: url("img/bg_star.png");
	width: 110px;
	height: 17px;
	background-position: 0 0;
	background-color: inherit;
}

.list_inner-box {
	width: 288px;
	height: 288px;
	position: absolute;
	left: 0;
	top: 0;
	display: none;
	transition: opacity 1s;
}

.list_inner-box h5 {
	width: 200px;
	height: 20px;
	margin: 30px 0 5px 50px;
	font-size: 20px;
	font-weight: 700;
	color: #fff;
	text-shadow: 0 0 1px #424242;
}

.list_inner-box p {
	margin-left: 50px;
	font-weight: 200;
	color: #fff;
	text-shadow: 0 0 1px #424242;
}

.list_inner-box dl {
	width: 200px;
	height: 20px;
	margin: 5px 0 0 50px;
	overflow: auto;
	color: #fff;
	text-shadow: 0 0 1px #424242;
}

.list_inner-box dl dt, dd {
	float: left;
	text-align: center;
}

.list_inner-box dl dt {
	margin-right: 15px;
}

.wrap_info {
	height: 30px;
	position: relative;
	margin: 5px 0 0 50px;
	width: 200px;
}

.wrap_info strong {
	position: absolute;
	text-shadow: 0 0 1px #424242;
}

.wrap_info strong.info_left {
	left: 0;
	top: 5px;
	color: #e65100;
}

.wrap_info strong.info_right {
	right: 0;
	top: 5px;
	color: #2196F3;
}

.wrap_info .slider {
	position: absolute;
	left: 50px;
}

li:hover .list_inner-box {
	display: block;
}

li:hover {
	background-color: #aaaaaa;
}

li:hover .btn_heart {
	background: white;
}

.toggle {
	width: 100px;
	height: 20px;
	border-radius: 5px;
	position: absolute;
	top: 3px;
	left: 50px;
}

.bar_toggle1 {
	background-color: #2196F3;
	position: relative;
}

.bar_toggle2 {
	width: 80px;
	position: absolute;
	left: 0;
	top: 0;
	background-color: #e65100;
}
</style>

</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp"></c:import>
	<div id="wrapMain">
		<div class="join_faria">
			<img src="/img/dinner.jpg">
			<div class="join_box">
				<h1>현재까지 3,457번의 페리아가 열렸습니다.</h1>
				<h2>함께 페리아를 즐겨보세요!</h2>
				<div class="select_date">
					<div class="datepicker_input">
						<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
							<input type="text" id="datepicker-input" aria-label="Date-Time">
							<div id="wrapper"></div>
							<span class="tui-ico-date"></span>
						</div>
						<!--//datepicker-->
					</div>
					<!--//datepicker_input-->
				</div>
				<div class="head_count"></div>
				<button class="btn_faria_join">페리아 참가</button>
			</div>
		</div>
		<div class="faria_list1">
			<h2>행복한 만찬 살펴보기</h2>
			<div class="wrapContent">
				<div class="list_feria">
					<ul>
					
					</ul>
				</div>
				<!--//.list_feria-->
			</div>
			<!--//#wrapContent-->
		</div>
		<div class="faria_list2">
			<h2>즐거운 술자리 둘러보기</h2>
			<div class="wrapContent">
				<div class="list_feria">
					<ul>
					
					</ul>
				</div>
				<!--//.list_feria-->
			</div>
			<!--//#wrapContent-->
		</div>
		<div class="faria_bibe">
			<h2>페리아에서 즐긴 비베 둘러보기</h2>
			<div class="wrap_list_bibe">
				<ul class="list_bibe">
				
				</ul>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/template/footer.jsp"></c:import>

<script src="js/tui-time-picker.js"></script>
<script src="js/tui-date-picker.js"></script>

<script type="text/template" id="feriaListTmpl">
<@ _.each(feriaList,function(feria) { @>
	<li class="feria flag_<@=feria.cenaType@> flag">
                <a href="/feria_detail.feria?fDateNo=<@=feria.fdateNo@>">
                    <div class="wrap_image_feria">
                        <!-- 사진 목록 -->
                        <ul class="list_image_feria">
						<@ _.each(feria.fImages, function(image) { @>
                            <li class="party"><img src="/img/<@=image.fImg@>" alt="페리아 이미지"/></li>
						<@ }) @>
                        </ul>
                    </div>
                    <button class="btn_prev"><i class="fas fa-caret-left"></i></button>
                    <button class="btn_next"><i class="fas fa-caret-right"></i></button>
                    <h4><@=feria.feriaName@></h4>
                    <strong class="num_heart"><@=feria.likeCount@></strong>

					<!--하트-->
                    <div class="btn_heart">
                        <div>
                            <input type="checkbox" class="checkbox" id="checkbox<@=feria.fDateNo@>" data-no="<@=feria.fDateNo@>" <@ if(feria.feriaFlag==true) { @> checked <@ } @> />
                            <label for="checkbox<@=feria.fDateNo@>">
                                <svg id="heart-svg" viewBox="467 392 58 57" xmlns="http://www.w3.org/2000/svg">
                                    <g id="Group" fill="none" fill-rule="evenodd" transform="translate(467 392)">
                                        <path d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z"
                                              id="heart" fill="#AAB8C2"/>
                                        <circle id="main-circ" fill="#E2264D" opacity="0" cx="29.5" cy="29.5" r="1.5"/>

                                        <g id="grp7" opacity="0" transform="translate(7 6)">
                                            <circle id="oval1" fill="#9CD8C3" cx="2" cy="6" r="2"/>
                                            <circle id="oval2" fill="#8CE8C3" cx="5" cy="2" r="2"/>
                                        </g>

                                        <g id="grp6" opacity="0" transform="translate(0 28)">
                                            <circle id="oval1" fill="#CC8EF5" cx="2" cy="7" r="2"/>
                                            <circle id="oval2" fill="#91D2FA" cx="3" cy="2" r="2"/>
                                        </g>

                                        <g id="grp3" opacity="0" transform="translate(52 28)">
                                            <circle id="oval2" fill="#9CD8C3" cx="2" cy="7" r="2"/>
                                            <circle id="oval1" fill="#8CE8C3" cx="4" cy="2" r="2"/>
                                        </g>

                                        <g id="grp2" opacity="0" transform="translate(44 6)">
                                            <circle id="oval2" fill="#CC8EF5" cx="5" cy="6" r="2"/>
                                            <circle id="oval1" fill="#CC8EF5" cx="2" cy="2" r="2"/>
                                        </g>

                                        <g id="grp5" opacity="0" transform="translate(14 50)">
                                            <circle id="oval1" fill="#91D2FA" cx="6" cy="5" r="2"/>
                                            <circle id="oval2" fill="#91D2FA" cx="2" cy="2" r="2"/>
                                        </g>

                                        <g id="grp4" opacity="0" transform="translate(35 50)">
                                            <circle id="oval1" fill="#F48EA7" cx="6" cy="5" r="2"/>
                                            <circle id="oval2" fill="#F48EA7" cx="2" cy="2" r="2"/>
                                        </g>

                                        <g id="grp1" opacity="0" transform="translate(24)">
                                            <circle id="oval1" fill="#9FC7FA" cx="2.5" cy="3" r="2"/>
                                            <circle id="oval2" fill="#9FC7FA" cx="7.5" cy="2" r="2"/>
                                        </g>
                                    </g>
                                </svg>
                            </label>
                        </div>
                    </div><!--//하트-->

                    <div class="list_member">
                        <img src="/img/<@=feria.profileImg@>" class="member king"/><span class="king_name"><@=feria.hostName@></span>
						<@ _.each(feria.pHeads, function(pHead) { @>
                        <img src="/img/<@=pHead.profileImg@>" class="member member<@=pHead.rownum@>"/>
						<@ }) @>
                    </div><!-- //.list_member-->
                </a>
            </li>
<@ }) @>
</script>


<script type="text/template" id="bibeTmpl">
    <@_.each(bibes,function(bibe){@>
    <li>
        <div class="gradation"></div>
        <img src="<@=bibe.img@>" alt="" class="img_bibe">
        <h4><@=bibe.title@></h4>
        <!-- 숫자를 강조하고 하트의 숫자니까 class로 변경 -->
        <strong class="num_heart"><@=bibe.like@></strong>
        <!--하트-->
        <div class="btn_heart">
            <div>
                <input type="checkbox" class="heart_checkbox" id="checkbox<@=bibe.no + 6@>" <@ if(bibe.flag=="true") { @> checked <@ } @> />
                <label for="checkbox<@=bibe.no + 6@>">
                    <svg id="heart-svg" viewBox="467 392 58 57" xmlns="http://www.w3.org/2000/svg">
                        <g id="Group" fill="none" fill-rule="evenodd" transform="translate(467 392)">
                            <path d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z"
                                  id="heart" fill="#AAB8C2"/>
                            <circle id="main-circ" fill="#E2264D" opacity="0" cx="29.5" cy="29.5" r="1.5"/>

                            <g id="grp7" opacity="0" transform="translate(7 6)">
                                <circle id="oval1" fill="#9CD8C3" cx="2" cy="6" r="2"/>
                                <circle id="oval2" fill="#8CE8C3" cx="5" cy="2" r="2"/>
                            </g>

                            <g id="grp6" opacity="0" transform="translate(0 28)">
                                <circle id="oval1" fill="#CC8EF5" cx="2" cy="7" r="2"/>
                                <circle id="oval2" fill="#91D2FA" cx="3" cy="2" r="2"/>
                            </g>

                            <g id="grp3" opacity="0" transform="translate(52 28)">
                                <circle id="oval2" fill="#9CD8C3" cx="2" cy="7" r="2"/>
                                <circle id="oval1" fill="#8CE8C3" cx="4" cy="2" r="2"/>
                            </g>

                            <g id="grp2" opacity="0" transform="translate(44 6)">
                                <circle id="oval2" fill="#CC8EF5" cx="5" cy="6" r="2"/>
                                <circle id="oval1" fill="#CC8EF5" cx="2" cy="2" r="2"/>
                            </g>

                            <g id="grp5" opacity="0" transform="translate(14 50)">
                                <circle id="oval1" fill="#91D2FA" cx="6" cy="5" r="2"/>
                                <circle id="oval2" fill="#91D2FA" cx="2" cy="2" r="2"/>
                            </g>

                            <g id="grp4" opacity="0" transform="translate(35 50)">
                                <circle id="oval1" fill="#F48EA7" cx="6" cy="5" r="2"/>
                                <circle id="oval2" fill="#F48EA7" cx="2" cy="2" r="2"/>
                            </g>

                            <g id="grp1" opacity="0" transform="translate(24)">
                                <circle id="oval1" fill="#9FC7FA" cx="2.5" cy="3" r="2"/>
                                <circle id="oval2" fill="#9FC7FA" cx="7.5" cy="2" r="2"/>
                            </g>
                        </g>
                    </svg>
                </label>
            </div>
        </div><!--//.btn_heart-->
        <a href="#"></a>
        <img src="<@=bibe.profile@>" class="member king" /><span class="king_name"><@=bibe.discover@></span>
        <span class="bg_full_star"></span>
        <span class="bg_void_star"></span>
        <div class="list_inner-box">
            <h5>함께 즐긴 음식</h5>
            <p>#양식 #중식 #일식</p>
            <dl>
                <dt>주종</dt>
                <dd><@=bibe.type@></dd>
            </dl>
            <dl>
                <dt>도수</dt>
                <dd><@=bibe.ABV@>도</dd>
            </dl>
            <dl>
                <dt>제조</dt>
                <dd><@=bibe.manufacturer@></dd>
            </dl>
            <div class="wrap_info">
                <strong class="info_left">드라이</strong>
                <div class="bar_toggle1 toggle">
                    <div class="bar_toggle2 toggle" style="width: <@=bibe.sweet@>px"></div>
                </div>
                <strong class="info_right">달콤함</strong>
            </div>
            <div class="wrap_info">
                <strong class="info_left">탄산</strong>
                <div class="bar_toggle1 toggle">
                    <div class="bar_toggle2 toggle" style="width: <@=bibe.carbonate@>px"></div>
                </div>
                <strong class="info_right">무탄산</strong>
            </div>
            <div class="wrap_info">
                <strong class="info_left">가벼움</strong>
                <div class="bar_toggle1 toggle">
                    <div class="bar_toggle2 toggle" style="width: <@=bibe.weight@>px"></div>
                </div>
                <strong class="info_right">무거움</strong>
            </div>
        </div>
    </li>
    <@})@>



</script>

<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script>
	_.templateSettings = {
		interpolate : /\<\@\=(.+?)\@\>/gim,
		evaluate : /\<\@([\s\S]+?)\@\>/gim,
		escape : /\<\@\-(.+?)\@\>/gim
	};
	
	/* 20-08-12 조현득 */
	//feriaListTmp 선언
	const feriaListTmp = _.template($("#feriaListTmpl").html());

	//각각의 파티
	let cnts = [ 0, 0, 0, 0, 0, 0 ];

	/* 20-08-12 조현득 */
	//faria_list1 ul
	$feriaList1 = $(".faria_list1 ul");
	//faria_list2 ul
	$feriaList2 = $(".faria_list2 ul");


	//왼쪽 버튼을 클릭하면
	$(".list_feria > ul").on("click",".btn_prev",function(e) {
	
	    //자신이 몇 번째 파티인지 얻어옴
	    const idx = $(this).parents(".feria").index();
	    console.log(idx);
	
	    //클릭시 링크 이동을 막는다.
	    e.preventDefault();
	
	    //1씩 감소
	    --cnts[idx];
	
	    //만약 idx가 -1이면 다시 6으로
	    if (cnts[idx] == -1) {
	
	        cnts[idx] = $(this).parent().find(".party").length - 1;
	
	    }//if() end
	
	    //이미지의 width 만큼
	    let left = cnts[idx] * 380;
	
	    //그 페리아의 이미지 ul을 왼쪽으로 옮겨 오른쪽 사진이 나오게 함
	    $(this).parent().find(".list_image_feria").css("left", -left);
	});
	
	//오른쪽 버튼을 클릭하면
	$(".list_feria > ul").on("click",".btn_next",function(e) {
	
		//자신이 몇 번째 파티인지 얻어옴
		const idx = $(this).parents(".feria").index();
	    console.log(idx);
	
	    //클릭시 링크 이동을 막는다.
	    e.preventDefault();
	    //1씩 증가
	    ++cnts[idx];
	
	    const partyNum = $(this).parent().find(".party").length;
	
	    //만약 숫자가 6이 되면 다시 0번째 사진으로 가도록 함
	    if (cnts[idx] == partyNum) {
	        cnts[idx] = 0;
	    }
	    
	    let left = cnts[idx] * 380;
	    $(this).parent().find(".list_image_feria").css("left", -left);
	});
	
	
	/* 20-08-12 정예찬, 조현득 */
	 //페리아 목록 불러오는 ajax, 기본값 1페이지
    let pageNo = 1;
    
    function getBobList() {
		$.ajax({
			url:"/ajax/getBobList.feria",
			type:"get",
			data:{
				likesType:"F",//게시물 타입 F(페리아)
				pageNo:pageNo,//파라미터로 보낼 페이지(스크롤 끝에서 1씩 증가)
			},
			dataType:"json",
			error:function(xhr,error,code){
				alert("점검중");
			},
			success:function(json){
				/* alert("연결됨"); */
				
				console.log(json);

				//ul에 템플릿으로 만든 li를 차례대로 붙임
				$feriaList1.append(feriaListTmp({feriaList:json}));
			},
		})//ajax() end
    };//getBobList() end
    getBobList();
    
    function getSulList() {
		$.ajax({
			url:"/ajax/getSulList.feria",
			type:"get",
			data:{
				likesType:"F",//게시물 타입 F(페리아)
				pageNo:pageNo,//파라미터로 보낼 페이지(스크롤 끝에서 1씩 증가)
			},
			dataType:"json",
			error:function(xhr,error,code){
				alert("점검중");
			},
			success:function(json){
				/* alert("연결됨"); */
				
				console.log(json);

				//ul에 템플릿으로 만든 li를 차례대로 붙임
				$feriaList2.append(feriaListTmp({feriaList:json}));
			},
		})//ajax() end
    };//getSulList() end
    getSulList();
    
	
	const bibeTmp = _.template($("#bibeTmpl").html());

	const $listBibe = $(".list_bibe");

	const $a = $(".list_bibe li a");

	const $innerBox = $(".list_inner-box");

	const $li = $("<li>");

	//bibe를 ajax로 얻어오는 메서드
	function getBibe() {

		$.ajax({
			type:"get",
			url : "/ajax/bibeList3.json",
			dataType:"json",
			error : function() {
				console.log("에러");
			},
			success : function(json) {
				console.log(json);

				$listBibe.append(bibeTmp({bibes : json}));
			}
		});//$.ajax() end

	}//getBibe() end
	getBibe();
	
	
	//하트 클릭시 이벤트
    $(".list_feria > ul").on("click",".checkbox",function() {
    	
    	//클릭한 하트의 게시물 번호를 얻어옴
    	let no = this.dataset.no;
    	
    	//클릭한 요소의 조상을찾고, num_heart를 찾아서 제이쿼리 객체로 만듦
    	let $numHeart = $(this).parents(".feria").find(".num_heart");
    	
		$.ajax({
			url:"/ajax/checkLikes.feria",
			type:"get",
			dataType:"json",
			data:{
				likesType:"F",//게시물 타입 F(페리아)
				no:no,//게시물 번호를 파라미터로 넘김
			},
			error:function(xhr,error,code){
				alert("점검중");
			},
			success:function(json){
				console.log(json);
				
				$numHeart.text(json.count);
				
			}//success end
		})//$.ajax() end
    });//click() end
	
	
</script>

<script>
	$startpickerInput = $("#startpicker-input");
	$dateRangeStart = $(".date_range_start");
	$dateRangeEnd = $(".date_range_end");
	$dateRangeOutput = $(".date_range_output");
	$datepickerInput = $(".datepicker_input");
	$btnDeleteRepeat = $(".btn_delete_repeat")

	const $btnClose = $(".btn_close");
	const $btnRepeat = $(".btn_repeat");
	const $btnConfirm = $(".btn_confirm");
	const $wrapRepeat = $("#wrapRepeat");

	const $btnFilterLabel = $(".btn_filter+label");

	var datepicker = new tui.DatePicker('#wrapper', {
		date : new Date(),
		input : {
			element : '#datepicker-input',
			format : 'yyyy-MM-dd'
		},
		language : 'ko',
		timePicker : true
	});

	/*팝업 닫는 이벤트*/
	$btnClose.click(function(e) {
		e.preventDefault();
		$wrapRepeat.hide();
	});
	$btnConfirm.click(function(e) {
		e.preventDefault();
		$wrapRepeat.hide();
		$datepickerInput.hide();
		$dateRangeOutput.show();
		$btnRepeat.css("left", 265);
	});
	/*팝업 뜨게하는 이벤트*/
	$btnRepeat.click(function(e) {
		e.preventDefault();
		$wrapRepeat.show();

	})//팝업뜨게 하는 이벤트

	var today = new Date();
	var picker = tui.DatePicker.createRangePicker({
		startpicker : {
			date : today,
			input : '#startpicker-input',
			container : '#startpicker-container'
		},
		endpicker : {
			date : today,
			input : '#endpicker-input',
			container : '#endpicker-container'
		},
		selectableRanges : [ [
				today,
				new Date(today.getFullYear() + 1, today.getMonth(), today
						.getDate()) ] ],
		language : 'ko'
	});

	$btnFilterLabel.on("click", function(e) {
		e.preventDefault();
		let id = $(this).attr("for");
		$("#" + id).attr('checked', function() {
			return !$(this).attr('checked');
		});
		$(this).toggleClass("on");
		console.log(id);
	});

	//기간 시작일 가져오기

	picker.on('change:start', function() {
		const startDate = moment(picker.getStartDate());
		console.log(startDate.format("YYYY-MM-DD"));
		$dateRangeStart.text(startDate.format("YYYY-MM-DD") + " ");

	});

	picker.on('change:end', function() {
		const endDate = moment(picker.getEndDate());
		console.log(endDate);
		$dateRangeEnd.text(" " + endDate.format("YYYY-MM-DD"));
	});

	$btnDeleteRepeat.on("click", function() {
		$datepickerInput.show();
		$dateRangeOutput.hide();
		$dateRangeStart.empty();
		$dateRangeEnd.empty();
	});
</script>
</body>
</html>