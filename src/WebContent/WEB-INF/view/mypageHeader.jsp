<%@page import="com.intime.feria.dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!--마이페이지 헤더-->
<div id="wrapMypageHeader">
    <div class="mypage_img">
        <img src="img/${loginUser.profileImg}" alt="프로필이미지">
        <h4>${loginUser.firstName}</h4>
    </div>
    <div class="mypage_text">
        <span>${loginUser.profileCMT}</span>
    </div>
    <div class="mypage_info">
        <div class="text_box1">
            <div><strong>${loginUser.firstName}님은</strong></div>
            <div><strong>${invitedTotal }</strong>번의 페리아에 초대받았고,</div>
            <div>직접 준비한 세나로</div>
            <div><strong>${inviteTotal }명</strong>의 손님을 맞이 했습니다.</div>
        </div>
        <div class="text_box2">
            <div>회원가입일</div>
            <div>
            <fmt:formatDate value="${loginUser.joinDate }" pattern="YYYY년 MM월 dd일"/>
            
            </div>
        </div>
        <div class="img_box">
            <img src="img/pie1.jpg" alt="프로필">
            <div class="img_text">
                <div>밀가루2000g</div>
                <div>설탕2000g</div>
            </div>
        </div>
    </div>

    <!--마이페이지 탭-->
    <div class="tabmenu">
        <ul>
            <li id="tab1" class="btnCon">
                <a class="tabmenu_link" id="btn1" href="#">호스트</a>
                <!--                <div class="tabCon"></div>-->
            </li>

            <li id="tab2" class="btnCon">
                <a class="tabmenu_link" id="btn2" href="/guest_participatedFeria.jsp">게스트</a>
                <!--                <div class="tabCon"></div>-->
            </li>

            <li id="tab3" class="btnCon">
                <a class="tabmenu_link2" id="btn3" href="/friend_management.jsp">친구관리</a>
                <!--                <div class="tabCon"></div>-->
            </li>

            <li id="tab4" class="btnCon">
                <a class="tabmenu_link2" id="btn4" href="/blackList.jsp">블랙리스트</a>
                <!--                <div class="tabCon">There are manys etc.</div>-->
            </li>
        </ul>
    </div>
    <!--마이페이지 탭 끝-->

</div>
<!--마이페이지 헤더끝-->

<script src="js/jquery.js"></script>
<script>
    $btn1 = $("#btn1");
    $btn2 = $("#btn2");
    $btn3 = $("#btn3");
    $btn4 = $("#btn4");

    $btn1.click(function () {
        console.log("click");
        $(this).addClass("tab1");
        $btn2.removeClass("tab1");
        $btn3.removeClass("tab2");
        $btn4.removeClass("tab2");
    })

    $btn2.click(function () {
        console.log("click");
        $(this).addClass("tab1");
        $btn1.removeClass("tab1");
        $btn3.removeClass("tab2");
        $btn4.removeClass("tab2");
    })

    $btn3.click(function () {
        console.log("click");
        $(this).addClass("tab2");
        $btn2.removeClass("tab1");
        $btn1.removeClass("tab1");
        $btn4.removeClass("tab2");
    })

    $btn4.click(function () {
        console.log("click");
        $(this).addClass("tab2");
        $btn2.removeClass("tab1");
        $btn3.removeClass("tab2");
        $btn1.removeClass("tab1");
    })


</script>