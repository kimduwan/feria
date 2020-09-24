<%@page import="com.intime.feria.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
<c:when test="${loginUser == null }">
<div id="wrapHeader">
    <h1>
        <a href="/main.jsp">Feria</a>
    </h1>
    <div id="wrapMenu">
        <ul>
            <li><a href="/login.feria" class="btn_menu">페리아에 참가하기</a></li>
            <li><a href="/login.feria" class="btn_menu">페리아에 손님 맞이하기</a></li>
            <li><a href="/feria.jsp" class="btn_menu">페리아</a></li>
            <li><a href="/feria_bibe_communityList.feria" class="btn_menu">비베</a></li>
            <li><a href="#" class="btn_menu">회원가입</a></li>
            <li>
                <a href="/login.feria" class="btn_login">
                    로그인
                </a>
            </li>
        </ul>
    </div><!--#wrapMenu end-->
</div><!--#wrapHeader end  -->
</c:when>
<c:otherwise>
<div id="wrapHeader">
    <h1>
        <a href="/main.jsp">Feria</a>
    </h1>
    <div id="wrapMenu">
        <ul class="wrap_menu">
            <li><a href="/feria_participate.feria" class="btn_menu">페리아에 참가하기</a></li>
            <li><a href="/mypage.jsp" class="btn_menu">페리아에 손님 맞이하기</a></li>
            <li><a href="/feria.jsp" class="btn_menu">페리아</a></li>
            <li><a href="/feria_bibe_communityList.feria" class="btn_menu">비베</a></li>
            <li><a href="#" class="btn_alarm"><i class="fas fa-bell"></i></a></li>
            <li><a href="#" class="btn_account"><img src="img/user.png" alt="프로필"><span>${loginUser.firstName }</span></a>
                <ul class="account_depth account_on">
                    <li><a href="#">호스트</a></li>
                    <li><a href="/guest_participatedFeria.feria">게스트</a></li>
                    <li><a href="#">설정</a></li>
                    <li><a href="/logout.feria">로그아웃</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div><!-- //#wrapHeader -->
</c:otherwise>
</c:choose>

<script src="/js/jquery.js"></script>
<script>

const $btnAccount = $(".btn_account");
const $accountDepth = $(".account_depth");

$btnAccount.on("click",function () {

    if($accountDepth.hasClass("account_on")){
        $accountDepth.removeClass("account_on");
    }else{
        $accountDepth.addClass("account_on");
    }

})//$accountDepth click end


</script>