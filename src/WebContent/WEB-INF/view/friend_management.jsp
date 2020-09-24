<%@page import="com.intime.feria.util.PaginateUtil"%>
<%@page import="com.intime.feria.vo.Request"%>
<%@page import="java.util.List"%>
<%@page import="com.intime.feria.dao.RequestsDAO"%>
<%@page import="com.intime.feria.vo.PageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Feria | 친구관리</title>
    <!--  reset.css  -->
    <link rel="stylesheet" href="/css/reset.css"/>
    <!--  notosanskr.css  -->
    <link rel="stylesheet" href="/css/notosanskr.css"/>
    <!--  favicon 설정  -->
    <link rel="icon" href="/img/logo.ico"/>
    <!-- 폰트어썸 아이콘 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!--  외부 friend_management.css  -->
    <link rel="stylesheet" href="/css/friend_management.css"/>
    <!-- header.css -->
    <link rel="stylesheet" href="/css/header.css"/>
    <!-- small_header.css -->
    <link rel="stylesheet" href="/css/small_header.css">
    <link rel="stylesheet" href="/css/paginate.css">
</head>
<body>

<div id="wrapContent">
    <div id="searchFriend">
        <form action="/request.feria" method="post" id="putEmail">
            <div id="inputAndList">
                <input name="email" id="fmEmailInput" class="input_fm_email" type="text" autocomplete="off" placeholder="친구 이메일 입력">
                <ul id="itemList"></ul>
            </div>
            <button id="addFriendBtn">친구 신청</button>
        </form>
        <p>&#8251; 신청시 바로 요청됩니다. &#8251;</p>
    </div>
    <div class="list_friend">
        <div class="request_friend">
            <h3>친구 요청</h3>
            <ul id="reqFrList"></ul>
        </div><!--//.request_friend-->
        <div class="friends">
            <h3>등록된 친구</h3>
            <ul id="regFrList"></ul>
        </div><!--//.friends-->
    </div><!--//.list_friend-->
</div><!--//#wrapContent-->

<!--친구 삭제 팝업-->
<div id="wrapPopup">
    <div id="popupDeleteFriend">
        <form method="post" action="friendDelete.jsp">
            <fieldset>
                <legend class="screen_out">친구 삭제 확인</legend>
                <div class="popup_delete_friend">
                    <span>친구 목록에서 삭제하시겠습니까?</span>
                    <div class="btn_delete">
                        <a href="delete_friend.jsp" class="delete">삭제</a>
                        <button type="button" class="not_delete">아니요</button>
                    </div>
                </div><!--//.popup_delete_friend-->
            </fieldset>
        </form>
    </div><!--//#popupDeleteFriend-->
</div><!--//#wrapPopup-->
<script type="text/template" id="requestTmpl">
<@if(fReqList.length != 0) {@>
    <@ _.each(fReqList, function(request){ @>
	<li>
		<a href="friend_detail.jsp" class="link_friend_detail">
			<img class="img_friend" src="profile/<@=request.profileImg@>"/>
			<span><@=request.name@></span>
		</a>
        <a href="" data-no="<@=request.no@>" class="btn_add_friend friend_btn">친구 추가</a>
        <a href="" data-no="<@=request.no@>" class="btn_not_friend friend_btn">거절</a>
	</li>
    <@ }); @>
	<@=reqPaginate@>
<@ } @>
</script>
<script type="text/template" id="friendsTmpl">
<@if(fRegList.length != 0) {@>
    <@ _.each(fRegList, function(friend){ @>
    		<li>
        <a class="move_friend_detail" href="uesr.jsp">
            	<img class="img_friend" src="profile/<@=friend.profileImg@>"/>
            	<span><@=friend.name@></span>
        </a>
            	<a href="" data-no="<@=friend.no@>" class="btn_delete_friend"><i class="fa fa-times"></i></a>
    		</li>
    <@ }); @>
    <@=regPaginate@>
<@ } @>
</script>
<script src="/js/underscore-min.js"></script>
<script src="/js/jquery.js"></script>
<script>
    /* ======================================= var ======================================= */
    _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
    const $itemList = $("#itemList");
    const $fmEmailInput = $("#fmEmailInput");
    const requestTmpl = _.template($("#requestTmpl").html());
    const friendsTmpl = _.template($("#friendsTmpl").html());
    const $reqFrList = $("#reqFrList");
    const $regFrList = $("#regFrList");
    let reqPage = 1;
    let regPage = 1;

    /* ======================================= func ======================================= */
    function emailLoad() {
        $.ajax({
            url: "/ajax/searchUsers.feria",
            type:"get",
            dataType:"json",
            error: function () {
                alert("에러");
            },
            success: function (json) {
                $itemList.empty();
                console.log(json);
                // console.log(json.email);
                // console.log(json[0].cList[3]);
                // console.log(json[0].cList.length);
                let cnt = 0;

                for (let i = 0; i < json.length; i++) {
                    // 있으면 0, 없으면 -1
                    console.log($fmEmailInput.val());
                    console.log(json[i].email.indexOf($fmEmailInput.val()));
                    if ($fmEmailInput.val() != "") {
                        if (json[i].email.indexOf($fmEmailInput.val()) != -1) {
                            const $li = $("<li>").text(json[i].email);
                            $li.appendTo("#itemList");
                            cnt++;
                        }
                    }
                }
            }
        });
    }

    function requestLoad() {
        $.ajax({
            url: "/ajax/getRequestList.feria",
            data:{
            	reqPage:reqPage
            },
            type:"GET",
            error: function () {
                alert("에러");
            },
            success: function (requests) {
                //const markup = requestTmpl({"requests":requests});

                $reqFrList.html(requestTmpl(requests));
            }
        });
    }

    function friendLoad() {
        $.ajax({
            url: "/ajax/getFriendList.feria",
            data:{
            	regPage:regPage
            },
            type:"get",
            error: function () {
                alert("에러");
            },
            success: function (friends) {
            	$regFrList.html(friendsTmpl(friends));
            }
        });
    }

    /* ======================================= event ======================================= */

    $itemList.hide();
    
    $fmEmailInput.keydown(function (event){
        $itemList.show();
        emailLoad();
    });

    $itemList.on("click", "li", function () {
        emailLoad();    // 클릭시 input에 값 넘어가고 해당 글자랑 같은거만 보여주려고
        $fmEmailInput.val($(this).text());
        $fmEmailInput.focus();
    });

    $("#wrapContent").on("click", function() {
        $itemList.hide();
    });

    requestLoad();
    friendLoad();
    
    $reqFrList.on("click",".paginate a",function(e) {
    	e.preventDefault();
    	
    	reqPage = this.dataset.page;
    	
    	requestLoad();
    	
    });
    
    $regFrList.on("click",".paginate a",function(e) {
    	e.preventDefault();
    	
    	regPage = this.dataset.page;
    	
    	friendLoad();
    	
    });
    
    $reqFrList.on("click", ".btn_add_friend", function(e) {
    	const no = this.dataset.no;
    	
    	$.ajax({
    		url:"/ajax/fAccept.json",
    		data: {
    			no:no
    		},
    		type:"GET",
    		error:function(){
    			
    		},
    		success:function(json){
    			if(json.result){
    				requestLoad();
    				friendLoad();
    			}
    		}
    	});
    });
    
    $reqFrList.on("click", ".btn_not_friend", function(e) {
    	
    	const no = this.dataset.no;
    	
    	$.ajax({
    		url:"/ajax/fReject.json",
    		data: {
    			no:no
    		},
    		type:"GET",
    		error:function(){
    			
    		},
    		success:function(json){
    			if(json.result){
    				requestLoad();
    				friendLoad();
    			}
    		}
    	});
    });
    
    $regFrList.on("click", ".btn_delete_friend", function(e) {
    	const no = this.dataset.no;
    	
    	$.ajax({
    		url:"/ajax/fDelete.json",
    		data: {
    			no:no
    		},
    		type:"GET",
    		error:function(){
    			
    		},
    		success:function(json){
    			if(json.result){
    				requestLoad();
    				friendLoad();
    			}
    		}
    	});
    });

    /*등록된 친구의 X버튼 클릭 시*/
    $(".btn_delete_friend").click(function (e) {
        /*친구 삭제 팝업을 띄운다(display none에서 block으로 변경)*/
        e.preventDefault();
        $("#wrapPopup").css("display", "block")
    });

    /*친구 삭제 팝업에서 아니요를 누르면*/
    $(".not_delete").click(function () {
        $("#wrapPopup").css("display", "none");
    });

</script>
</body>
</html>