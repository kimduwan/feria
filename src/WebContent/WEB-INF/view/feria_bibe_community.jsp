<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>bibe</title>
    <link rel="icon" href="/img/logo.jpg">
    <link href="css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/notosanskr.css">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/tui-date-picker.css">
    <link rel="stylesheet" href="/css/toggle.css">
    <link rel="stylesheet" href="/css/heart.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/paginate.css">
      <c:import url="/WEB-INF/template/link.jsp"></c:import>
    
    <style>
        #wrapContent{
            width: 1250px;
            margin: 100px auto 100px;
            position: relative;
        }
        #wrapContent legend{
            display: none;
        }
        #wrapContent h2{
            font-size: 36px;
            text-align: center;
        }
        #wrapContent h3{
            margin-top: 5px;
            margin-bottom: 50px;
            font-size: 20px;
            border-bottom: 1px solid #9e9e9e;
            text-align: center;
            padding: 10px;
        }
        #wrapContent .wrap_select{
            margin-top: 10px;
            width: 400px;
            height: 50px;
            position: absolute;
            right: 0;
            top: 85px;
        }
       .select_bibe{
           width: 125px; /* 원하는 너비설정 */
           padding: .8em .5em; /* 여백으로 높이 설정 */
           font-family: inherit;  /* 폰트 상속 */
           background: url('img/dwon_arrow.png') no-repeat 95% 50%; /* 네이티브 화살표를 커스텀 화살표로 대체 */
           background-size: 20px 20px;
           border: 1px solid #9e9e9e;
           border-radius: 5px; /* iOS 둥근모서리 제거 */
           -webkit-appearance: none; /* 네이티브 외형 감추기 */
           -moz-appearance: none;
           appearance: none;
       }
        #wrapContent .wrap_list_bibe{
            width: 1250px;
            min-height: 300px;
            position: absolute;
            top: 150px;
        }
        #wrapContent .wrap_list_bibe .list_bibe{
            float: left;
        }
        .list_bibe li{
            width: 288px;
            height: 288px;
            margin-bottom: 10px;
            margin-left: 10px;
            position: relative;
            border: 1px solid #9e9e9e;
            float: left;
        }
        .box_bibe{
        	float:left;
        }
        .list_bibe li h4{
        }
        .list_bibe li a{
            display: inline-block;
            width: 288px;
            height: 288px;
            cursor: pointer;
            position: absolute;
            left: 0; top: 0;
            z-index: 5;
        }
        .list_bibe li .img_bibe{
            display: block;
            height: 288px;
            margin: auto;
        }
        .list_bibe li:hover .img_bibe{
            display: none;
            height: 288px;
            margin: auto;
        }
        .list_bibe li h4{
            position: absolute;
            left: 5px;
            top: 5px;
            font-size: 20px; color: #fff; font-weight: 700;
            text-shadow: 0 0 2px #222222;
            background-color: inherit;
        }
        .list_bibe li .num{
            position: absolute;
            right: 5px;
            top: 5px;
            font-size: 16px;
            color: #eee;
            background-color: #424242;
        }
        .list_bibe .king{
            position: absolute;
            left: 10px; bottom: 10px;
            width: 40px; height: 40px;
            border-radius: 50%;
            background-color: inherit;
        }
        .list_bibe .king_name{
            position: absolute;
            font-size: 16px;
            left: 50px; bottom: 17px;
            color: #eee;
            background-color: inherit;
        }
        .list_bibe .bg_full_star{
            position: absolute;
            right: 5px;
            bottom: 15px;
            font-size: 16px;
            color: #eee;
            background-image: url("img/bg_star.png");
            width: 110px; height: 17px;
            background-position: 0 -20px;
            z-index: 1;
            background-color: inherit;
        }
        .list_bibe .bg_void_star{
            position: absolute;
            right: 5px;
            bottom: 15px;
            font-size: 16px;
            color: #eee;
            background-image: url("img/bg_star.png");
            width: 110px; height: 17px;
            background-position: 0 0;
            background-color: inherit;
        }
        .list_inner-box{
            width: 288px;
            height: 288px;
            position: absolute;
            left: 0; top: 0;
            display: none;
            transition: opacity 1s;
        }
        .list_inner-box h5{
            width: 200px;
            height: 20px;
            margin: 30px 0 5px 50px;
            font-size: 20px;
            font-weight: 700;
            color: #fff;
            text-shadow: 0 0 1px #424242;
        }
        .list_inner-box p{
            margin-left: 50px;
            font-weight: 200;
            color: #fff;
            text-shadow: 0 0 1px #424242;
        }
        .list_inner-box dl{
            width: 200px;
            height: 20px;
            margin: 5px 0 0 50px;
            overflow: auto;
            color: #fff;
            text-shadow: 0 0 1px #424242;
        }
        .list_inner-box dl dt,dd{
            float: left;
            text-align: center;
        }
        .list_inner-box dl dt{
            margin-right: 15px;
        }
        .wrap_info{
            height: 30px;
            position: relative;
            margin: 5px 0 0 50px;
            width: 200px;
        }
        .wrap_info strong{
           position: absolute;
            text-shadow: 0 0 1px #424242;
        }
        .wrap_info strong.info_left{
            left: 0; top: 5px;
            color: #e65100;
        }
        .wrap_info strong.info_right{
            right: 0; top: 5px;
            color: #2196F3;
        }
        .wrap_info .slider{
            position: absolute;
            left: 50px;
        }

        li:hover .list_inner-box{
            display: block;
        }
        li:hover {
            background-color: #aaaaaa;
        }
        li:hover .btn_heart{
            background: white;
        }
        .toggle{
            width: 100px;
            height: 20px;
            border-radius: 5px;
            position: absolute;
            top: 3px;
            left: 50px;
        }

        .bar_toggle1{
            background-color: #2196F3;
            position: relative;
        }
        .bar_toggle2{
            width: 80px;
            position: absolute;
            left: 0; top: 0;
            background-color: #e65100;
        }
    </style>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"></c:import>

<div id="wrapContent">
    <div class="wrap_select">
        <select name="bibeOrder" id="bibeOrder_grade" class="select_bibe">
            <option value="1">높은평점 순</option>
        </select>
        <select name="bibeOrder" id="bibeOrder_kinds" class="select_bibe">
            <option value="1">종류별 보기</option>
        </select>
        <select name="bibeOrder" id="bibeOrder_cena_category" class="select_bibe">
            <option value="1">종류별 보기</option>
        </select>
    </div>
    <h2>비베</h2>
    <h3>페리아를 빛낸 비베를 살펴보고 모두를 즐겁게 할 마실거리를 준비해보세요.</h3>
    <div class="wrap_list_bibe">
        
         
    </div>
   
   	
</div>
	
<script type="text/template" id="bibeTml">
    <@_.each(bibes,function(bibe){@>
	<ul class="list_bibe">
    <li class="box_bibe">
        <div class="gradation"></div>
        <img src="/img/<@=bibe.bibeImg@>" alt="" class="img_bibe">
        <h4><@=bibe.bibeName@></h4>
        <!-- 숫자를 강조하고 하트의 숫자니까 class로 변경 -->
        <strong class="num_heart">3,383k</strong>
        <!--하트-->
        <div class="btn_heart">
            <div>
                <input type="checkbox" class="heart_checkbox" id="checkbox<@=bibe.bibeNo@>"/>
                <label for="checkbox<@=bibe.bibeNo@>">
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
        <img src="img/<@=bibe.profileImg@>" class="member king" /><span class="king_name"></span>
        <span class="bg_full_star"></span>
        <span class="bg_void_star"></span>
        <div class="list_inner-box">
            <h5>함께 즐긴 음식</h5>
            <p>#양식 #중식</p>
            <dl>
                <dt>주종</dt>
                <dd>양주</dd>
            </dl>
            <dl>
                <dt>도수</dt>
                <dd>47도</dd>
            </dl>
            <dl>
                <dt>제조</dt>
                <dd>바카디</dd>
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

	</ul>
	 
    <@})@>
		<@=paginate@>
</script>

<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script>

	_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

    const bibeTmp = _.template($("#bibeTml").html());

    const $wrap_list_bibe = $(".wrap_list_bibe");

    const $a = $(".list_bibe li a");

    const $innerBox = $(".list_inner-box");

    const $li = $("<li>");
	let page=1;
    //bibe를 ajax로 얻어오는 메서드
    function getBibe() {

        $.ajax({

            url:"/ajax/feria_bibe_communityLists.feria",
            type:"GET",
            dataType:"json",
			data:{page:page},
            error:function () {
                console.log("에러");
            },
            success:function (json) {
                console.log(json);

                $wrap_list_bibe.html(bibeTmp(json));
            }
        });//$.ajax() end

    }//getBibe() end

    getBibe();


	
	$(".wrap_list_bibe").on("click",".paginate a",function(e){
		
		e.preventDefault();
		
		page=this.dataset.page;
		getBibe();
		
	})
	
	
</script>

</body>
</html>