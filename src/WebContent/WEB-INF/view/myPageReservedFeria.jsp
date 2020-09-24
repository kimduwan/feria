<%@page import="com.intime.feria.vo.User"%>
<%@page import="com.intime.feria.util.PaginateUtil"%>
<%@page import="com.intime.feria.dao.UsersDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.intime.feria.vo.PageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게스트_예약리스트</title>
    <link rel="stylesheet" href="css/all.min.css">
    
    <link rel="stylesheet" href="css/notosanskr.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/paginate.css">
    <link rel="icon" href="img/logo.jpg">
    <style>
        /*폰트*/
        body{font-family: 'Noto Sans KR', sans-serif; user-select: none;}

        .wrap_content{
            margin: auto;
            width: 1200px;
        }
        .attend_feria_header{
            /*background-color: yellowgreen;*/
            width: 1000px;
            height: 100px;
            text-align: center;
            margin: auto;
        }
        .attend_feria_header h2{
            padding-top: 20px;
            font-size: 30px;
            margin-bottom: 25px;
        }
        .attend_feria_header h3{
            border-bottom: 1px solid #9e9e9e;
            padding-bottom: 10px;
            margin-bottom: 50px;
        }

        /* ul,li를 감싸는 DIV */
        .wrap_feria_bording{
            /*background-color: greenyellow;*/
            margin: auto;
            width: 1000px;
            height: 570px;
            position: relative;
        }
        .wrap_feria_bording::after{
            content: "";
            display: block;
            clear: both;
        }

        /* u l */
        .list_feria_bording{
            /*background-color: #80d2ff;*/
            width: 1000px;
            height: 470px;
            overflow: hidden;
            float: left;
            position: absolute;
            right: 0; top: 0;
            margin-top: 50px;
            background-color: rgba(var(--b3f,250,250,250),1);
        }

        /* l i */
        .item_bording_feria{
            border: 1px solid #dbdbdb;
            width: 487.7px; height: 100.5px;
            float: left;
            position: relative;
            margin-bottom: 20px;
            cursor: pointer;
            background-color: #fff;
        }
        /* odd : 홀수애들 선택
          even : 짝수애들 선택*/
        .item_bording_feria:nth-child(odd){
            margin-right: 20px;
        }

        .item_bording_feria img{
            width: 100.5px; height: 100.5px;
            position: absolute;
            left: 0; top: 0;
        }
        
        /*페리아메세지*/
		.list_feria_bording .feria_msg {
			width: 1000px;
            height: 100px;
            text-align: center;
            padding-top: 50px;
		}

        /*깃발*/
        .item_bording_feria .flag{
            width: 22px; height: 25px;
            text-align: center;
            line-height: 25px;
            position: absolute;
            left: 5px; top: 0px;
        }
        .item_bording_feria .flag::before{
            content: "";
            position: absolute;
            left: 0; top: 19px;
        }
        .item_bording_feria .flag::after{
            content: "";
            position: absolute;
            right: 0; top: 19px;
        }
        .item_bording_feria .flag_B{
            background-color: #e65100;
        }
        .item_bording_feria .flag_B::before{
            border-bottom:15px solid transparent;
            border-left:15px solid #e65100;
        }
        .item_bording_feria .flag_B::after{
            border-bottom:15px solid transparent;
            border-right:15px solid #e65100;
        }
        .item_bording_feria .flag_S{
            background-color: #2196F3;
        }
        .item_bording_feria .flag_S::before{
            border-bottom:15px solid transparent;
            border-left:15px solid #2196F3;
        }
        .item_bording_feria .flag_S::after{
            border-bottom:15px solid transparent;
            border-right:15px solid #2196F3;
        } /*--여기까지 깃발--*/

        .item_bording_feria .feria_name{
            position: absolute;
            top: 13px; left: 120px;
            width: 310px;
            font-weight: 400;
            font-size: 20px;
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
        }
        .item_bording_feria .feria_time{
            font-weight: 400;
            font-size: 18px;
            height: 25px;
            position: absolute;
            line-height: 25px;
            bottom: 13px;
            right: 20px;
        }
        .item_bording_feria .feria_private_open{
            /*background-color: #9e9e9e;*/
            width: 200px;
            height: 25px;
            font-size: 18px;
            line-height: 25px;
            color: #e65100;
            border: none;
            position: absolute;
            left: 120px;
            bottom: 13px;
        }
        .item_bording_feria .feria_open_btn {
        	color: #fff;
        	font-size: 12px;
        	width: 34px;
        	height: 20px;
        	background-color: #e65100;
        	border: 1px solid #e65100;
        	border-radius: 5px;
        	padding: 0 5px;
        	line-height: 20px;
        	text-align: center;
        	position: absolute;
        	left: 120px;
        	bottom: 13px;
            display: none;
        }
        .paginate{
            /*background-color: gold;*/
            width: 200px;
            height: 35px;
            font-size: 15px;
            line-height: 35px;
            position: absolute;
            bottom: 0;
            left: 410px;
            margin: 0;
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
		
		/*
		비활성화
		*/
		.paginate span.next,
		.paginate span.prev {
			color:#E1E1E1;
			cursor:default;
			cursor:not-allowed;
		}
    </style>
</head>
<body>
<div class="wrap_content">
    <div class="attend_feria_header">
        <h2>예약 리스트</h2>
        <h3>참가했던 페리아를 확인해볼까요?</h3>
    </div><!--//.attend_feria_header end-->
    
    <div class="wrap_feria_bording">
    
    	<%-- 2020-08-07 박상훈 <%if(list.isEmpty()) { %> --%>  	
        <ul class="list_feria_bording">
        <c:if test="${userFeiras.isEmpty() }">
					<p class="feria_msg">아직 신청 또는 참가한 페리아가 없습니다.</p>
	    </c:if>
        <c:forEach items="${userFeiras }" var="user">
			<li class="item_bording_feria">
				<img src="img/${user.cenaImg}>" alt="세나이미지">
				<span class="flag flag_${user.cenaType}">${user.cenaType}</span>
				<div class="feria_name">${user.feriaName }</div>
				<div class="feria_time">${user.feriaDateChange }</div>
				<span class="feria_open_btn">${user.prtcOpenStr }</span>
				<span class="feria_private_open">${user.feriaConfirmStr }</span>
				<input type="hidden" value="${user.prtcCntNo }" id="public"/>
		    </li>
        </c:forEach>
        </ul>
        ${paginate }
    </div><!--//.wrap_feria_bording end-->
</div><!--//.wrap_content end-->


<script src="js/jquery.js"></script>
<script>

    const $ul = $('.list_feria_bording');

    //ul요소의 공개/비공개 버튼을 누를 때
    //$ul.on("click", ".feria_open_btn", function(){
    	
    	//const prtcCntNo = $(this).siblings("#public").val();
    	//alert(prtcCntNo);
    	
    //	if($(this).html()=='공개') {
    //		$(this).text("비공개")
   // 	}else{
  //  		$(this).text("공개")
   // 	}
    	
    	//ajax
    //	$.ajax({
   // 		url: "/ReservedFeira.feria",
   // 		type: "get",
   // 		dataType: "json",
   // 		data: {
   // 			"prtcCntNo":prtcCntNo
   // 		},//parameter
   //			error:function(request,status,error) {
	//   			alert("사이트 서버 점검 중입니다.\n이용에 불편을 드려 대단히 죄송합니다.");
   // 		},//error callblack
   // 		success:function(json) {
					
    //			console.log(json.count);
    			
  //  		}//success callback
   // 	});//$.ajax end
    	
    	
    	/* if($(this).hasClass("private")){
    		$(this).removeClass("private").text("공개").css({"background-color":"#fff", "color":"#e65100"});
    	}else{
    		$(this).addClass("private").text("비공개").css({"background-color":"#e65100", "color":"#fff"});
    	} */
    });

</script>
</body>
</html>
