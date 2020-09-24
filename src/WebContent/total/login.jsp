<%@page import="com.intime.feria.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Feria | 회원가입</title>
    <!--  reset.css  -->
    <link rel="stylesheet" href="css/reset.css" />
    <!--  notosanskr.css  -->
    <link rel="stylesheet" href="css/notosanskr.css" />
    <!--  favicon 설정  -->
    <link rel="icon" href="img/logo.ico"/>
    <!--  외부 join.css  -->
    <link rel="stylesheet" href="css/login.css" />
</head>
<body>

<!--div에 not 이라는 클래스를 주면 유효성 검사 뜸-->

    <div id="headerJoin">
        <a href="index.jsp"><h1>Feria</h1></a>
    </div><!--//#header-->
    <div id="contentLogin">
        <h2>로그인</h2>
        <form action="/login.feria" method="post">
            <fieldset>
                <legend class="screen_out">로그인 폼</legend>
                <div class="row full">
                    <h3 class="screen_out">이메일</h3>
                    <label for="email" class="screen_out">이메일</label>
                    <input autocomplete="off" name="email" type="text" id="email" placeholder="이메일을 입력해주세요." />
                </div><!--//.row-->
                <div class="row full">
                    <h3 class="screen_out">비밀번호</h3>
                    <label for="password" class="screen_out">비밀번호</label>
                    <input name="pwd" type="password" id="password" placeholder="비밀번호를 입력해주세요." title="비밀번호를 입력해주세요."/>
                </div><!--//.row-->
                <div class="row indent">
                    <p>아이디나 비밀번호가 정확하지 않습니다.</p>
                </div><!--//.row-->
                <div class="row indent">
                    <p>페리아가 처음이신가요? <a href="join.jsp" class="link_join">회원가입</a></p>
                </div><!--//.row-->
                <div class="row">
                    <button id="loginBtn" type="submit">로그인</button>
                </div><!--//.row-->
            </fieldset>
        </form>
    </div><!--//#contentLogin-->

    <script src="js/jquery.js"></script>
    <script>
    <%
    String msg = (String)session.getAttribute("msg");
                    		
    session.removeAttribute("msg");
    
    if(msg!=null){
    %>
    alert("<%=msg%>");
    <%}%>
        /*
        정규 표현식(Regular Expression)
        - 특정한 규칙을 가진 문자열의 집합을 표현하는 데 사용
        - 유효성 검사에 사용(형식이 맞나 틀리나)
        - ex) 숫자? 영어? 한글만? 이메일? 전화 번호 형식이 맞는지
        - 자바 스크립트에서는 정규 표현식 객체가 있다.
        - 정규 표현식 객체의 생성
        1) new RegExp();
        2) //;            (/^&)

        - 정규 표현식 객체의 메서드
        1) test(문자열) : 인자로 받은 문자열이 해당 정규표현식을 만족하면 true 불만족하면 false

        정규 표현식의 특수문자들
        1) ^ : 시작
        2) $ : 끝
        3) | : 혹은 (A혹은 B) -> /^a|b$/; : a, b 둘중에 하나로 시작하고 끝나야 함
        4) [] : 한 글자임을 나타냄
        5) [0-9] or [\d] : 숫자만 -> const reg = /^[0-9]$/;
        6) [\w] or [0-9|a-z|A-Z] : 영어와 숫자만
        7) {} : 자릿수 표현
        8) [ㄱ-힣] : 한글만 표현
        8-2) [가-힣] : 초성이 아닌 한글만 표현


     */

    </script>
</body>
</html>