<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>호스트가보는 호스트페이지_지난페리아</title>
    <link rel="stylesheet" href="/css/all.min.css">
    <link rel="stylesheet" href="/css/notosanskr.css">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/paginate.css">
    <link rel="icon" href="/img/logo.jpg">
    <style>
        /*폰트*/
        body{
            font-family: "Noto Sans KR", sans-serif;
            -webkit-font-smoothing: antialiased;
        }

        .wrap_content{
            margin: 0 auto;
            width: 1000px;
            min-height: 1000px;
        }



        .wrap_last_feria{
            /*background-color: pink;*/
            width: 1000px;
            margin-top: 20px;
            position: relative;
            margin-bottom: 80px;
			
        }


        /*비베 컬렉션*/
        .wrap_last_feria_bibe{
            /*background-color: skyblue;*/
            width: 1000px;
            height: 187px; /*bibe_collection의 보더위아래1px씩 합한값 150+25+10+2*/
        }
        .wrap_last_feria_bibe h3{
            font-size: 25px;
        }
        .wrap_bibe_collect{
            /*background-color: pink;*/
            height: 150px;
            width: 1000px;
            border-top: 1px solid #9e9e9e;
            border-bottom: 1px solid #9e9e9e;
            margin-top: 10px;
            position: relative;
            overflow: hidden;
        }
        .list_bibe_collect{
            height: 150px;
            overflow: hidden;
            position: absolute;
            left: 0;
            top: 0;
        }
        .list_bibe_collect::before{
            content: "";
            clear: both;
        }
        .wrap_bibe_collect button{
            border: none;
            cursor: pointer;
            background-color: transparent;
            font-size: 20px;
            position: absolute;
            outline: none;
            z-index: 1;
        }
        .wrap_bibe_collect .btn_left_bibe{
            left: 0;
            top: 60px;
        }
        .wrap_bibe_collect .btn_right_bibe{
            right: 0;
            top: 60px;
        }
        #select_arrange{
            position: absolute;
            right: 0;
            top: 0;
            padding: 3px 5px;
        }
        .img_item_bibe{
            /*background-color: greenyellow;*/
            float: left;
            width: 115px;
            height: 150px;
            margin: 0 5px;
            cursor: pointer;
        }
        .img_item_bibe img{
        	width:115px;
            height:150px;
            display: block;
        }
        /*지난 페리아 및 paginate*/
        .wrap_last_feria_list{
            /*background-color: peachpuff;*/
            width: 1000px;
            height: 550px;
            margin-top: 40px;
            position: relative;
            margin-bottom: 20px;
        }
        .wrap_last_feria_list h3{
            font-size: 25px;
            margin-bottom: 10px;
        }
        .wrap_lastferia{
            /*background-color: palegreen;*/
            position: relative;
            width: 1000px;
            height: 520px;
        }
        .list_lastferia{
            width: 1000px;
            height: 472px;
            overflow: hidden;
            float: left;
            position: absolute;
            right: 0; top: 0;
            background-color: rgba(var(--b3f,250,250,250),1);
        }
        .item_lastferia{
            border: 1px solid #dbdbdb;
            width: 487.3px;
            height: 100.5px;
            float: left;
            position: relative;
            margin-bottom: 20px;
            cursor: pointer;
            background-color: #fff;
        }
        /*
        odd : 홀수애들 선택
        even : 짝수애들 선택
        */
        .item_lastferia:nth-child(odd){
            margin-right: 20px;
        }
        .item_lastferia img{
            width: 100.5px; height: 100.5px;
            position: absolute;
            left: 0; top: 0;
        }
        .paginate{
            /*background-color: gold;*/
            width: 200px;
            height: 35px;
            font-size: 15px;
            line-height: 35px;
            position: absolute;
            left: 400px; bottom: 0;
        }
        .paginate a,
        .paginate span,
        .paginate strong{
            color:#858585;
            text-decoration:none;
            padding:4px 14px;
            border:1px solid transparent;
            transition:.1s ease;

        }

        .paginate span {
            border-color:#E1E1E1;
            cursor: not-allowed;
        }

        .paginate a:hover {
            opacity:0.5;
            background-color: #e65100;
            border-color:#fff;
            font-weight:bold;
            color:#fff;
        }

        .paginate strong {
            background:#e65100;
            color:#fff;
            cursor: not-allowed;
            font-weight:bold;
            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
        .paginate .screen_out {
            border: 0;
        }

        /*깃발*/
        .item_lastferia .flag{
            width: 22px; height: 25px;
            text-align: center;
            line-height: 25px;
            position: absolute;
            left: 5px; top: 0;
        }
        .item_lastferia .flag::before{
            content: "";
            position: absolute;
            left: 0; top: 19px;
        }
        .item_lastferia .flag::after{
            content: "";
            position: absolute;
            right: 0; top: 19px;
        }
        .item_lastferia .flag_B{
            background-color: #e65100;
        }
        .item_lastferia .flag_B::before{
            border-bottom:15px solid transparent;
            border-left:15px solid #e65100;
        }
        .item_lastferia .flag_B::after{
            border-bottom:15px solid transparent;
            border-right:15px solid #e65100;
        }
        .item_lastferia .flag_S{
            background-color: #2196F3;
        }
        .item_lastferia .flag_S::before{
            border-bottom:15px solid transparent;
            border-left:15px solid #2196F3;
        }
        .item_lastferia .flag_S::after{
            border-bottom:15px solid transparent;
            border-right:15px solid #2196F3;
        } /*--여기까지 깃발--*/

        .item_lastferia .feria_name{
            position: absolute;
            top: 13px; left: 120px;
            width: 310px;
            font-weight: 400;
            font-size: 20px;
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
        }
        .item_lastferia .reserv_time{
            font-weight: 400;
            font-size: 18px;
            height: 25px;
            position: absolute;
            line-height: 25px;
            bottom: 13px;
            right: 20px;
        }


        /*페리아 리뷰*/
        .wrap_feria_review{
            /*background-color: papayawhip;*/
            width: 1000px;
            margin: 10px 0;
            min-height: 500px;
        }
        .wrap_review_header{
            height: 50px;
            width: 1000px;
            /*background-color: palegreen;*/
        }
        .wrap_review_header h3{
            font-size: 25px;
            margin-bottom: 5px;
        }
        .wrap_review_header span{
            font-size: 15px;
        }
        .wrap_review{
            margin-top: 5px;
            width: 1000px;
            height: 845px;
            overflow-y: scroll;
            overflow-x:hidden;
            position: relative;
        }
        .wrap_review::after{
            content: "";
            display: block;
            clear: both;
        }
        .wrap_review::-webkit-scrollbar {
            background-color: rgba(var(--b6a,219,219,219),1);
            width: 0;
        }
        .list_feria_review {
            width: 1000px;
            /*height: 1267.5px;*/
        }
        .feria_review{
            display: inline-block;
            width: 1000px;
            height: auto;
            padding: 10px 0;
            margin-bottom: 20px;
            background-color: rgba(var(--b3f,250,250,250),1);
        }
        .review_who{
            width: 1000px;
            height: 150px;
            float: left;
            position: relative;
            z-index: 1;
        }
        .review_who img{
            width: 150px;
            height: 150px;
            border-radius: 50%;
            position: absolute;
            left: 0;
            top: 0;
        }
        .review_who .nickname{
            line-height: 25px;
            position: absolute;
            left: 170px;
            top: 0;
            /*background-color: lightpink;*/
        }
        .review_who p{
            /*border: 1px solid #9e9e9e;*/
            /*background-color: paleturquoise;*/
            width: 830px;
            height: 100px;
            line-height: 20px;
            position: absolute;
            left: 170px;
            top: 35px;
            overflow: auto;
        }
        .review_bibe_item{
            /*background-color: sandybrown;*/
            border: 1px solid #9e9e9e;
            /*width: 185px;*/
            width: 156px;
            height: 255px;
            float: left;
            position: relative;
            margin-top: 15px;
            /*margin-right: 15px;*/
            margin-right: 10px;
            background-color: #fff;
        }
        .review_bibe_item strong{
            /*background-color: yellow;*/
            width: 160px;
            height: 30px;
            /*border-bottom: 1px solid #9e9e9e;*/
            line-height: 30px;
            font-weight: 300;
            font-size: 18px;
            position: absolute;
            top: 0;
            padding: 0 0 0 10px;
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
        }
        .review_bibe_item:nth-child(6n){
            margin-right: 0;
        }
        .review_bibe_item .img_review_bibe{
            height: 220px;
            position: absolute;
            top: 31px; left: 0;
        }

        /*하트 여기로 들어와야함!!*/
        /*.review_bibe_item i{
            position: absolute;
            top: 45px; right: 5px;
            color: #888888;
        }*/

        /*----하트----*/
        .review_bibe_item .btn_heart {
            display: flex;
            width: 10px;
            height: 10px;
            position: absolute;
            right: 15px;
            top: 50px;
            border: 0;
            cursor: pointer;
            font-size: 24px;
            text-align: center;
            outline: none;
            align-items: center;
            justify-content: center;
        }
        svg {
            cursor: pointer;
            overflow: visible;
            width: 60px;
        }
        svg #heart {
            transform-origin: center;
            animation: animateHeartOut 0.3s linear forwards;
        }
        svg #main-circ {
            transform-origin: 29.5px 29.5px;
        }
        .checkbox {
            display: none;
        }
        .checkbox:checked + label svg #heart {
            transform: scale(0.2);
            fill: #E2264D;
            animation: animateHeart 0.3s linear forwards 0.25s;
        }
        .checkbox:checked + label svg #main-circ {
            transition: all 2s;
            animation: animateCircle 0.3s linear forwards;
            opacity: 1;
        }
        .checkbox:checked + label svg #grp1 {
            opacity: 1;
            transition: 0.1s all 0.3s;
        }
        .checkbox:checked + label svg #grp1 #oval1 {
            transform: scale(0) translate(0, -30px);
            transform-origin: 0 0 0;
            transition: 0.5s transform 0.3s;
        }
        .checkbox:checked + label svg #grp1 #oval2 {
            transform: scale(0) translate(10px, -50px);
            transform-origin: 0 0 0;
            transition: 1.5s transform 0.3s;
        }
        .checkbox:checked + label svg #grp2 {
            opacity: 1;
            transition: 0.1s all 0.3s;
        }
        .checkbox:checked + label svg #grp2 #oval1 {
            transform: scale(0) translate(30px, -15px);
            transform-origin: 0 0 0;
            transition: 0.5s transform 0.3s;
        }
        .checkbox:checked + label svg #grp2 #oval2 {
            transform: scale(0) translate(60px, -15px);
            transform-origin: 0 0 0;
            transition: 1.5s transform 0.3s;
        }
        .checkbox:checked + label svg #grp3 {
            opacity: 1;
            transition: 0.1s all 0.3s;
        }
        .checkbox:checked + label svg #grp3 #oval1 {
            transform: scale(0) translate(30px, 0px);
            transform-origin: 0 0 0;
            transition: 0.5s transform 0.3s;
        }
        .checkbox:checked + label svg #grp3 #oval2 {
            transform: scale(0) translate(60px, 10px);
            transform-origin: 0 0 0;
            transition: 1.5s transform 0.3s;
        }
        .checkbox:checked + label svg #grp4 {
            opacity: 1;
            transition: 0.1s all 0.3s;
        }
        .checkbox:checked + label svg #grp4 #oval1 {
            transform: scale(0) translate(30px, 15px);
            transform-origin: 0 0 0;
            transition: 0.5s transform 0.3s;
        }
        .checkbox:checked + label svg #grp4 #oval2 {
            transform: scale(0) translate(40px, 50px);
            transform-origin: 0 0 0;
            transition: 1.5s transform 0.3s;
        }
        .checkbox:checked + label svg #grp5 {
            opacity: 1;
            transition: 0.1s all 0.3s;
        }
        .checkbox:checked + label svg #grp5 #oval1 {
            transform: scale(0) translate(-10px, 20px);
            transform-origin: 0 0 0;
            transition: 0.5s transform 0.3s;
        }
        .checkbox:checked + label svg #grp5 #oval2 {
            transform: scale(0) translate(-60px, 30px);
            transform-origin: 0 0 0;
            transition: 1.5s transform 0.3s;
        }
        .checkbox:checked + label svg #grp6 {
            opacity: 1;
            transition: 0.1s all 0.3s;
        }
        .checkbox:checked + label svg #grp6 #oval1 {
            transform: scale(0) translate(-30px, 0px);
            transform-origin: 0 0 0;
            transition: 0.5s transform 0.3s;
        }
        .checkbox:checked + label svg #grp6 #oval2 {
            transform: scale(0) translate(-60px, -5px);
            transform-origin: 0 0 0;
            transition: 1.5s transform 0.3s;
        }
        .checkbox:checked + label svg #grp7 {
            opacity: 1;
            transition: 0.1s all 0.3s;
        }
        .checkbox:checked + label svg #grp7 #oval1 {
            transform: scale(0) translate(-30px, -15px);
            transform-origin: 0 0 0;
            transition: 0.5s transform 0.3s;
        }
        .checkbox:checked + label svg #grp7 #oval2 {
            transform: scale(0) translate(-55px, -30px);
            transform-origin: 0 0 0;
            transition: 1.5s transform 0.3s;
        }
        .checkbox:checked + label svg #grp2 {
            opacity: 1;
            transition: 0.1s opacity 0.3s;
        }
        .checkbox:checked + label svg #grp3 {
            opacity: 1;
            transition: 0.1s opacity 0.3s;
        }
        .checkbox:checked + label svg #grp4 {
            opacity: 1;
            transition: 0.1s opacity 0.3s;
        }
        .checkbox:checked + label svg #grp5 {
            opacity: 1;
            transition: 0.1s opacity 0.3s;
        }
        .checkbox:checked + label svg #grp6 {
            opacity: 1;
            transition: 0.1s opacity 0.3s;
        }
        .checkbox:checked + label svg #grp7 {
            opacity: 1;
            transition: 0.1s opacity 0.3s;
        }
        @keyframes animateCircle {
            40% {
                transform: scale(10);
                opacity: 1;
                fill: #DD4688;
            }
            55% {
                transform: scale(11);
                opacity: 1;
                fill: #D46ABF;
            }
            65% {
                transform: scale(12);
                opacity: 1;
                fill: #CC8EF5;
            }
            75% {
                transform: scale(13);
                opacity: 1;
                fill: transparent;
                stroke: #CC8EF5;
                stroke-width: 0.5;
            }
            85% {
                transform: scale(17);
                opacity: 1;
                fill: transparent;
                stroke: #CC8EF5;
                stroke-width: 0.2;
            }
            95% {
                transform: scale(18);
                opacity: 1;
                fill: transparent;
                stroke: #CC8EF5;
                stroke-width: 0.1;
            }
            100% {
                transform: scale(19);
                opacity: 1;
                fill: transparent;
                stroke: #CC8EF5;
                stroke-width: 0;
            }
        }
        @keyframes animateHeart {
            0% {
                transform: scale(0.2);
            }
            40% {
                transform: scale(1.2);
            }
            100% {
                transform: scale(1);
            }
        }
        @keyframes animateHeartOut {
            0% {
                transform: scale(1.4);
            }
            100% {
                transform: scale(1);
            }
        }
        /*----하트----*/

        .review_bibe_item ul{
            /*background-color: #c1788b;*/
            position: absolute;
            bottom: 45px; right: 5px;
        }
        .review_bibe_item li{
            /*background-color: darkolivegreen;*/
            font-size:  16px;
            height: 20px;
            line-height: 20px;
        }
        .review_bibe_item .star_point_container {
            width: 70px;
            font-size: 10px;
            display: inline-block;
            position: absolute;
            bottom: 25px;
            right: 0;
        }

    </style>
</head>
<body>
<div class="wrap_content">
    <div class="wrap_last_feria">

        <div class="wrap_last_feria_bibe">
            <h3>비베 컬렉션</h3>
            <laba for="select_arrange" class="screen_out">비베정렬</laba>
            <select name="arrange" id="select_arrange">
                <option value="2">최신비베순</option>
                <option value="4">비베누적순</option>
                <option value="3">비베가격순</option>
            </select>
            <div class="wrap_bibe_collect">
                <button class="btn_left_bibe"><i class="fas fa-angle-left"></i></button>
                <button class="btn_right_bibe"><i class="fas fa-angle-right"></i></button>
                <ul class="list_bibe_collect">
                    <!--//에이젝스 스크립트 템플릿-->
                </ul>
            </div><!--//.wrap_bibe_collect end-->
        </div><!--//.wrap_last_feria_bibe end-->

        <div class="wrap_last_feria_list">
            <h3>지난 페리아</h3>
            <div class="wrap_lastferia">
                <ul class="list_lastferia">
                <c:if test="${ferias.isEmpty() }">
                	<p>아직 개최한 페리아가 없습니다.</p>
                </c:if>
                <c:forEach items="${ferias }" var="feria">
                    <li class="item_lastferia">
                        <img src="/img/${feria.cenaImg }" alt="세나사진">
                        <span class="flag flag_${feria.cenaType }">${feria.cenaType }</span>
                        <div class="feria_name">${feria.feriaName }</div>
                        <div class="reserv_time">${feria.feriaDateChange }</div>
                    </li>
                 </c:forEach>
                </ul>
                ${paginate }

            </div><!--.wrap_lastferia end-->
        </div><!--.wrap_last_feria_list end-->

        <div class="wrap_feria_review">
            <div class="wrap_review_header">
                <h3>페리아 리뷰</h3>
                <span>${numReview}개의 리뷰</span>
            </div>

            <div class="wrap_review">
                <ul class="list_feria_review">
                    <!--//템플릿 들어가는 자리-->
                </ul>
            </div><!--//.wrap_review-->

        </div><!--//.wrap_feria_review end-->

    </div><!--//.wrap_last_feria end-->
</div><!--//.wrap_content end-->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>

    <!--// 비베 언더스코어 템플릿-->
    <script type="text/template" id="bibeListTmpl"> 
        <@ _.each(bibes, function(hostbibe) { @>
            <li class="img_item_bibe"><img src="/img/<@=hostbibe.bibeImg@>" alt="<@=hostbibe.bibeName@>"></li>
        <@ }) @>
    </script>

    <!--// 페리아 리뷰 언더스코어 템플릿 -->
    <script type="text/template" id="fReviewTmpl">
        <@ _.each(freviews, function(freview, idx1) { @>
            <li class="feria_review">
                <div class="review_who">
                    <a href="#">
                        <img src="/img/<@=freview.fimg@>" alt="페리아사진">
                    </a>
                    <strong class="nickname"><@=freview.lastName@><@=freview.firstName@> <@=freview.frDateChange@></strong>
                    <p><@=freview.frText@></p>
                </div><!--//.review_who end-->
                <ul>
                <@ _.each(freview.bReviews, function(breview, idx2) { @>
                <li class="review_bibe_item">
                    <strong><@=breview.bibeName@></strong>
                    <img src="/img/<@=breview.bibeImg@>" class="img_review_bibe" alt="<@=breview.bibeName@>">
                    <!----하트---->
                    <div class="btn_heart">
                        <div>
                            <input type="checkbox" class="checkbox" id="checkbox<@=idx1+''+idx2@>"/> <!-- <@ if(breview.flag==true) { @> checked <@ } @> -->
                            <label for="checkbox<@=idx1+''+idx2@>">
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
                    </div><!----//하트---->
                    <ul>
                        <li>#<@=breview.brSwStr@></li>
                        <li>#<@=breview.brTsStr@></li>
                        <li>#<@=breview.brBdStr@></li>
                    </ul>
                    <div class="star_point_container">
                        <div class="star">
                            <i class="far fa-star"></i>
                            <i class="far fa-star"></i>
                            <i class="far fa-star"></i>
                            <i class="far fa-star"></i>
                            <i class="far fa-star"></i>
                        </div>
                    </div><!--//별점-->
                </li><!--//작은 리스트-->
                <@ }) @>
                </ul>
            </li><!--//큰 리스트-->
        <@ }) @>

    </script>

<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script>

	//언더스코어 jsp 파일 변환
	_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

    /* 2020-08-10 박상훈 스크립트 */
    //) 비베 리스트 템플릿 변수 선언
    const bibeList = _.template($("#bibeListTmpl").html());
    const $ul = $(".list_bibe_collect");

    //페리아 리뷰 템플릿 변수 선언
    const fReview = _.template($("#fReviewTmpl").html());
    const $fDiv = $(".list_feria_review");

    //버튼
    const $rightBtn = $(".btn_right_bibe");
    const $leftBtn = $(".btn_left_bibe");

    //버튼을 위한 변수
    let left = 0;
    
  	//width는 1000픽셀 
    let width = 1000;

    //현재 페이지를 저장하는 변수를 선언 후 초기화
    let curPage = 1;

    //비베리스트 호출을 위한 변수, 셀렉트요소의 옵션 디폴트 벨류
    let val = 2;
    
    //비베리스트를 불러오는 함수, 매개변수에 val을 삽입
    function getBibeList() {
    	console.log(left);

        $.ajax({
            // 객체선언
            url:"/ajax/bibeList.feria",//얻어오는 주소
            type:"GET",//요청의 method
            dataType:"json",//응답의 컨텐트 타입
            data:{"val":val},
            error:function (xhr, error, code){
                //에러확인
                alert("사이트 서버 점검 중입니다.\n이용에 불편을 드려 대단히 죄송합니다.");
                //console.log("xhr :"+xhr+", error :"+error+", code :"+code);
            },//에러콜백함수
            success:function (json) {

                //선언된 템플릿에 변수bibes를 선언하여 json을 담는다
                const markup = bibeList({bibes:json});

                //확인
                //console.log(markup);

                //부모요소에 자식요소(템플릿)을 넣음
                $ul.html(markup);
                
                //==========================슬라이드 막기==========================//
                //length는 li요소의 길이
                let length = $(".list_bibe_collect>li").length;
                let total = Math.floor(length/8)+1;
                let width = total*1000;

                //ul의 width는 위에서 계산한 값으로 늘림
                $(".list_bibe_collect").css({"width":width, left:0});
                
                //오른쪽 버튼을 클릭했을 때 ul 이동
                $rightBtn.on("click", function () {
                    left -= 1000;
                    if(left == -width) {
                        left = 0;
                    }
                    $ul.css("left",left);
                });//$rightBtn end

                //왼쪽 버튼을 클릭했을 때 ul 이동
                $leftBtn.on("click", function () {
                    if(left == 0) {
                        left = 0;
                    }else {
                        left += 1000;
                    }
                    $ul.css("left",left)
                });//$leftBtn end
              //==========================슬라이드 막기==========================//
                
            }//성공콜백함수
        });//$.ajax() end
    }//getBibeList() end

    getBibeList();

    //select의 option이 바뀔 때마다 ajax 호출
    $("#select_arrange").on("change", function () {
		
        //option 요소의 value 속성값을 변수 val에 초기화
        val = $(this).val();
        
  		left = 0;
  		
        //alert(val);
        getBibeList();
        
    });//select_arrange.on(change) end

    //호스트의 페리아 리뷰를 호출하는 에이젝스
    function getFReviews() {
        //페리아 리뷰 에이젝스
        $.ajax({
            url:"/ajax/reviewsList.feria",
            type:"GET",
            dataType: "json",
            data: {"likeType":"B"}, //테이블에 B 대문자로 되어 있어서 B로 출력(라이크타입)
            error: function (xhr, error, code) {
                alert("사이트 서버 점검 중입니다.\n이용에 불편을 드려 대단히 죄송합니다.");
                //console.log("xhr :"+xhr+", error :"+error+", code :"+code);
            },
            success: function (json) {
                //console.log(json)
                //alert("하나 성공");
                const markup2 = fReview({freviews:json});
                //console.log(markup2);
                $fDiv.html(markup2);

            }
        });//ajax end
    }//getFReviews() end

    //처음 호출
    getFReviews();

    //무한스크롤 이벤트 스크롤 인지
    $(".wrap_review").on("scroll",function () {

        //div의 스크롤탑 높이
        const scrollTop = $(this).scrollTop();

        //ul의 높이
        const ulHeight = $(".list_feria_review").height();

        //div의 높이
        const divHeight = $(this).height();

        //console.log("스크롤탑 :"+scrollTop+" + div의 높이"+divHeight+"="+ulHeight)

        if(scrollTop + divHeight == ulHeight) {
            //currentlyPage 1 증가 후
            curPage++;
            //무한스크롤 끝에서 호출
            getFReviews();
        }//if end;

    })
    
</script>
</body>
</html>