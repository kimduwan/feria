<%@page import="com.intime.feria.dao.CitiesDAO"%>
<%@page import="com.intime.feria.vo.City"%>
<%@page import="java.util.List"%>
<%@page import="com.intime.feria.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 200807 조현득 -->
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Feria | 회원가입</title>	
    <!--  reset.css  -->
    <link rel="stylesheet" href="/css/reset.css"/>
    <!--  notosanskr.css  -->
    <link rel="stylesheet" href="/css/notosanskr.css"/>
    <!--  favicon 설정  -->
    <link rel="icon" href="/img/logo.ico"/>
    <!--  외부 join.css  -->
    <link rel="stylesheet" href="/css/join.css"/>
</head>
<body>

<!--div에 not 이라는 클래스를 주면 유효성 검사 뜸-->

<div id="headerJoin">
    <a href="/main.feria"><h1>Feria</h1></a>
</div><!--//#header-->
<div id="contentJoin">
    <h2>계속 이용을 원하시면 회원가입을 해주세요.</h2>
    <form action="/join.feria" method="POST" >
    <!-- <input id = "gugunInput" type="hidden" value="" name="gugunCd"/> -->
        <fieldset>
            <legend class="screen_out">회원가입 폼</legend>
            <div class="row full">
                <h3 class="screen_out">이메일</h3>
                <label for="email" class="screen_out">이메일</label>
                <input autocomplete="off" name="email" type="text" id="email" placeholder="이메일을 입력해주세요."/>
                <p class="msg email" id="msgEmail">&ast; 이메일을 정확히 입력해주세요.</p>
            </div><!--//.row-->
            <div class="row full">
                <h3 class="screen_out">이름</h3>
                <label for="firstName" class="screen_out">이름</label>
                <input autocomplete="off" name="firstName" type="text" id="firstName" placeholder="이름"/>
                <p class="msg first_name">&ast; 이름을 다시 입력해주세요.</p>
            </div><!--//.row-->
            <div class="row full">
                <h3 class="screen_out">성</h3>
                <label for="lastName" class="screen_out">성</label>
                <input autocomplete="off" name="lastName" type="text" id="lastName" placeholder="성"/>
                <p class="msg last_name">&ast; 성을 다시 입력해주세요.</p>
            </div><!--//.row-->
            <div class="row full">
                <h3 class="screen_out">비밀번호</h3>
                <label for="password" class="screen_out">비밀번호</label>
                <input name="password" type="password" id="password" placeholder="비밀번호 설정하기 (8~12자까지 입력해주세요.)"
                       title="비밀번호 설정하기 (8~12자까지 입력해주세요.)"/>
                <p class="msg password">&ast; 8~16자 영문 대 소문자, 숫자를 사용하세요.</p>
            </div><!--//.row-->
            <div class="row full">
                <h3 class="screen_out">비밀번호 확인</h3>
                <label for="password2" class="screen_out">비밀번호 확인</label>
                <input type="password" id="password2" placeholder="비밀번호 확인" title="비밀번호 확인"/>
                <p class="msg password">&ast; 비밀번호를 정확히 입력해주세요.</p>
            </div><!--//.row-->
            <div class="row box_birth_date">
                <h3>생일</h3>
                <label for="year" class="screen_out">년도</label>
                <input name="year" type="text" id="year" placeholder="년(4자)"/>
                <label for="month" class="screen_out">월</label>
                <select name="month" id="month">
                    <option>월</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                    <option>9</option>
                    <option>10</option>
                    <option>11</option>
                    <option>12</option>
                </select>
                <label for="date" class="screen_out">일</label>
                <input name="date" type="text" id="date" placeholder="일"/>
                <p class="msg birth_date">&ast; 태어난 년도 4자리를 정확하게 입력하세요.</p>
            </div><!--//.row-->
            <div class="row box_verify">
                <h3>휴대전화 본인 인증</h3>
                <label for="phoneNumber" class="screen_out">전화번호</label>
                <input name="phoneNumber" autocomplete="off" id="phoneNumber" type="text" placeholder="전화번호 입력"/>
                <button disabled id="sendBtn" class="btn" type="button">인증 번호 발송</button>
                <div class="sub_row">
                    <label for="verify" class="screen_out">인증번호</label>
                    <input disabled id="verify" type="text" placeholder="인증번호 4자리 입력"/>
                    <button id="inBtn" disabled class="btn" type="button">인증하기</button>
                </div><!--//.sub_row-->
            </div><!--//.row-->
            
            
            <div class="row">
                <h3>주소</h3>
                <label for="adress" class="screen_out">주소</label>
                <select id="sido" name="sidoCd">
                	<option id="hide">시/도</option>
               	<c:forEach items="${cities }" var="city">
				    <option value="${city.cityNo}">${city.cityName }</option>
				</c:forEach>
				</select>
				<select id="gugun" name="gugunCd">
				    
				</select>
            </div><!--//.row-->
            
            
            <div class="row box_btn">
                <button disabled class="btn" type="submit" id="joinBtn">가입하기</button>
            </div><!--//.row-->
            <div class="row">
                <p>이미 페리아 계정이 있나요? <a href="/login.feria" class="link_login">로그인</a></p>
            </div><!--//.row-->
        </fieldset>
    </form>
</div><!--//#contentJoin-->

	<!-- 동적으로 생성되는 요소는 input type hidden을 통해서 파라미터 값을 넘길 수 있다 -->
	<script type="text/template" id="sidogugunListTmpl">
		<@ _.each(guguns, function(gugun) { @>
			<option class="gugun" value="<@=gugun.cityNo@>"><@=gugun.cityName@></option>
		<@ }) @>
	</script>
<script src="/js/jquery.js"></script>
<script src="/js/moment-with-locales.js"></script>
<script src="js/underscore-min.js"></script>
<script>

	//언더스코어 템플릿 jsp파일 세팅
	_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

    //이메일, 이름, 성, 비밀번호, 비밀번호 확인, 생일, 본인 인증, 주소
    //유효성 검사 확인 값 배열 (기본 false)
    const validArr = [false, false, false, false, false, false, false, false];


    //https://blog.naver.com/PostView.nhn?blogId=vnemftnsska2&logNo=221413061386&parentCategoryNo=&categoryNo=29&viewDate=&isShowPopularPosts=false&from=postView


    // 이메일 유효성 검사 : https://stackoverflow.com/questions/46155/how-to-validate-an-email-address-in-javascript
    const emailRegExp = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    // 이름 유효성 검사
    const firstNameRegExp = /^[가-힣]{1,6}$/;

    // 성 유효성 검사
    const lastNameRegExp = /^[가-힣]{1,3}$/;

    // 비밀 번호 유효성 검사
    const passwordRegExp = /^[\w]{8,16}$/;

    // 전화 번호 유효성검사
    const phoneNumberRegExp = /^[0-1]{3}[0-9]{4}[0-9]{4}$/;

    // 인증 번호 유효성 검사 (4자리 숫자만)
    const verifyRegExp = /^[\d]{4}$/;
    
    //Email
    const $email = $("#email");
    
	//기존의 글자를 저장하는 변수
    let oldEmail = "";
	
	//템플릿
	const $gugun = $("#gugun");
	const $sidogugunTmpl = _.template($("#sidogugunListTmpl").html());
	
	//시도, 구군 SELECT, INPUT
	const $gugunInput = $("#gugunInput");
	
    
    /* checkEmail() 이메일 체크 함수 */
    function checkEmail() {
    	
    	//alert("안녕 자바? 테스트 해볼게");
    	
    	//유저가 입력한 값을 받는다
    	let value = $email.val();
    	
    	
    	//이전 입력한 글자와 현재 입력된 글자 값이 같지 않을 때,
    	if(oldEmail!=value) {
    		
    		//현재 이메일을 이전 이메일로 업데이트
    		oldEmail = value;
    		
    		//이메일 체크를 다시 시작하니까 무조건 배열 0번지의 값을 false로 초기화
    		validArr[0] = false;

    		//자바스크립트의 정규식에 쓰이는 test() 메서드는 문자열에서 일치하는 항목을 검사하는 메서드로 true, false를 반환
    		console.log("flag:"+emailRegExp.test(value));
    		
    		//(조건식)현재 이메일을 정규표현식 검사할 때,
    		if(emailRegExp.test(value)) {
    			
    			//not클래스 제거 후 ok클래스 추가
    			$email.parent().removeClass('not').addClass('ok');
    			
    			//ajax가 작동 시작 됨
    			$("#msgEmail").text("Email 중복 확인 중입니다.");
    			
    			//form의 enctype 기본값(application/x-www-form-urlencoded)
    			$.ajax({
    				url: "/ajax/checkEmail.feria",
    				dataType:"json",
    				data:{"email":value},
    				error:function() {
    					alert("사이트 서버 점검 중입니다.\n이용에 불편을 드려 대단히 죄송합니다.");
    				},
    				success:function(json) {
    					
    					//json에서 이메일을 체크 후 count가 0일 때,
    					if(json.count==0) {
    						
    						//test text를 출력
    						console.log("test");
    						
    						//not클래스 제거 후 ok클래스 추가
    						$email.parent()
    						.removeClass('not')
    						.addClass('ok');
    						
    						//배열 0번지의 값을 true를 대입
    						validArr[0] = true;
    						
    						$("#msgEmail").text("아주 좋은 이메일입니다.");
    					}else {
    						//유효성 실패 시 not클래스 추가 후 ok클래스 제거
    						validArr[0] = false;
    						$email.parent()
    						.addClass('not')
    						.removeClass('ok');
    		    			$("#msgEmail").text("이미 사용중이거나 탈퇴한 Email입니다.");
    					}//if~else end
    					
    					
    				}//success end
    			});//$.ajax end
    			
    			
    			//(조건식)현재 이메일을 정규표현식 검사하지 않을 때,
    		}else {
    			
    			$email.parent().addClass('not').removeClass('ok');
    			$("#msgEmail").text("이메일을 제대로 입력해주세요.");
    			
    		};//if~else end
    		
    	};//if end
    	
    };//checkEmail()
    
    //이메일을 작성할 때 마다 checkEmail함수를 발동하고 커서를 다른 칸(인풋)으로 이동 할 때도
    //checkEmail함수를 발동시키며 Email에 포커스를 지정
    $email.keyup(checkEmail).blur(checkEmail).focus();
    
    
    

    /* //이메일 입력
    $("#email").keyup(function () {

        //입력한 이메일을 얻어옴
        const email = $(this).val();
        //alert(email);

        //0번지에 유효성 검사 결과(true, false)를 입력한다.
        validArr[0] = emailRegExp.test(email);

        //만약 배열 0번지가 유효성 통과하면(true)
        if (validArr[0]) {
            //이메일 인풋의 부모인 <div class="row full">에서 not클래스를 뺌
            $(this).parent().removeClass('not').addClass('ok');

        } else {
            //유효성 실패 시 not class 붙임
            $(this).parent().addClass('not').removeClass('ok');
        }//if~else end

        //가입하기 버튼 활성화 확인 함수
        checkValid();

    });//#email keyup() */

    /*이름 입력*/
    $("#firstName").keyup(function () {

        //입력한 이름 얻어옴
        const firstName = $(this).val();
        /*alert(firstName);*/

        //1번지에 유효성 검사 결과(true, false) 입력
        validArr[1] = firstNameRegExp.test(firstName);

        //만약 배열 1번지가 유효성 통과하면(true)
        if (validArr[1]) {
            //이름 인풋의 부모인 <div class="row full">에서 not클래스를 뺌
            $(this).parent().removeClass('not').addClass('ok');
        } else {
            //유효성 실패 시 not class 붙임
            $(this).parent().addClass('not').removeClass('ok');
        }//if~else end

        //가입하기 버튼 활성화 확인 함수
        checkValid();

    });/*//#firstName keyup()*/

    /*성 입력*/
    $("#lastName").keyup(function () {

        //입력한 성을 얻어옴
        const lastName = $(this).val();
        /*alert(lastName);*/

        //2번지에 유효성 검사 결과(true, false) 입력
        validArr[2] = lastNameRegExp.test(lastName);

        //만약 배열 2번지가 유효성 통과하면(true)
        if (validArr[2]) {
            //성 인풋의 부모인 <div class="row full">에서 not클래스를 뺌
            $(this).parent().removeClass('not').addClass('ok');
        } else {
            //유효성 실패 시 not class 붙임
            $(this).parent().addClass('not').removeClass('ok');
        }//if~else end

        //가입하기 버튼 활성화 확인 함수
        checkValid();

    });/*//#lastName keyup()*/

    /*비밀 번호 입력*/
    $("#password").keyup(function () {

        //입력한 비밀번호를 얻어옴
        const password = $(this).val();
        /*alert(password);*/

        //3번지에 유효성 검사 결과(true, false) 입력
        validArr[3] = passwordRegExp.test(password);

        //만약 배열 3번지가 유효성 통과하면(true)
        if (validArr[3]) {
            //비밀번호 인풋의 부모인 <div class="row full">에서 not클래스를 뺌
            $(this).parent().removeClass('not').addClass('ok');
        } else {
            //유효성 실패 시 not class 붙임
            $(this).parent().addClass('not').removeClass('ok');
        }//if~else end

        //비밀번호 확인 함수
        checkPassword2();

    });/*//#password keyup()*/

    /*비밀 번호 확인 입력*/
    $("#password2").keyup(checkPassword2);/*//#password keyup()*/

    //비밀번호 확인 함수
    function checkPassword2() {

        const password = $("#password").val();

        //입력한 비밀번호 확인을 얻어옴
        const password2 = $("#password2").val();
        /*alert(password2);*/

        //4번지에 유효성 검사 결과(true, false) 입력
        //비밀 번호랑 같아야 함
        validArr[4] = passwordRegExp.test(password2) && password == password2;

        //만약 배열 4번지가 유효성 통과하면(true)
        if (validArr[4]) {
            //비밀번호확인 인풋의 부모인 <div class="row full">에서 not클래스를 뺌
            $("#password2").parent().removeClass('not').addClass('ok');
        } else {
            //유효성 실패 시 not class 붙임
            $("#password2").parent().addClass('not').removeClass('ok');
        }//if~else end

        //가입하기 버튼 활성화 확인 함수
        checkValid();

    }/*//checkPassword2()*/

    $("#year,#date").keyup(checkBirthDate);

    $("#month").change(checkBirthDate);

    function checkBirthDate() {

        const year = $("#year").val();
        const month = $("#month").val();
        const date = $("#date").val();

        const birthDate = moment([year, month - 1, date]);

        validArr[5] = birthDate.isValid();

        //만약 배열 5번지가 유효성 통과하면(true)
        if (validArr[5]) {
            //인풋의 부모인 <div class="row full">에서 not클래스를 뺌
            $(".box_birth_date").removeClass('not').addClass('ok');
        } else {
            //유효성 실패 시 not class 붙임
            $(".box_birth_date").addClass('not').removeClass('ok');
        }//if~else end

        //가입하기 버튼 활성화 확인 함수
        checkValid();

    };/*//checkBirthDate()*/

    //휴대전화 번호 체크
    $("#phoneNumber").keyup(function () {

        //입력한 휴대폰 번호을 얻어옴
        const phoneNumber = $("#phoneNumber").val();

        //만약 폰번호가 유효성 검사 통과하면
        if (phoneNumberRegExp.test(phoneNumber)) {

            //not 클래스를 지우고 버튼을 활성화 시킴
            $(this).parent().removeClass('not');
            $("#sendBtn").attr("disabled", false);

        } else {

            //통과 못하면 not클래스 붙이고 disabled냅둠
            $(this).parent().addClass("not");
            $("#sendBtn").attr("disabled", true);

        }//if~else end

        //가입하기 버튼 활성화 할지 체크하는 함수 호출
        checkValid();

    });

    //인증 번호 발송 버튼을 누르면
    $("#sendBtn").click(function () {

        //폰번호를 가져옴
        const phone = $("#phoneNumber").val();

        //폰번호로 인증번호 보냈다는 alert창 띄움
        alert(phone + "으로 인증번호를 보냈습니다.");

        //인증번호 입력하는 인풋을 열어주고 바로 입력할 수 있게해줌
        $("#verify").attr("disabled", false).focus();

    });

    //인증번호 입력
    $("#verify").keyup(function () {

        //입력한 인증번호를 verify에 얻어옴
        const verify = $("#verify").val();

        //만약 인증번호가 유효성 검사 통과하면
        if (verifyRegExp.test(verify)) {

            //not 클래스를 지우고 발송 버튼을 활성화 시킴
            $(this).parent().removeClass('not');
            $("#inBtn").attr("disabled", false);

        } else {

            //통과 못하면 not클래스 붙이고 disabled냅둠
            $(this).parent().addClass("not");
            $("#inBtn").attr("disabled", true);

        }//if~else end

        //가입하기 버튼 활성화 할지 체크하는 함수 호출
        checkValid();

    });

    //인증하기 버튼을 클릭하면
    $("#inBtn").click(function () {

        //인증 완료되었다고 출력
        alert("인증이 확인되었습니다.");

        //모든 버튼을 비활성화 시킴
        $("#phoneNumber").attr("readonly", true);
        $("#sendBtn").attr("disabled", true);
        $("#verify").attr("disabled", true);
        $("#inBtn").attr("disabled", true);

        //배열 6번지에 true를 넣음
        validArr[6] = true;

        //가입하기 버튼 활성화 할지 체크하는 함수 호출
        checkValid();

    })//click() end    
    
    
    //셀렉트에 변화가 일어날 때 마다
    $("#sido").change(function() {
    	$("#hide").css("display","none")
    	
		//val이라는 변수에 선택된 value를 대입
    	const val = $(this).val();
    	//1) 호출 확인
    	//alert("함수 작동 테스트입니다.");
    	//2)$.ajax
    	$.ajax({
    		url:"/ajax/getGugunList.feria",
    		type:"GET",
    		dataType:"json",
    		data: {
    			"cityNo":val
    		},
    		error: function() {
    			alert("사이트 서버 점검 중입니다.\n이용에 불편을 드려 대단히 죄송합니다.");
    		},//error callback
    		success: function(json) {
    			
    			console.log(json);
    			
    			const markup = $sidogugunTmpl({guguns:json});
    			$gugun.html(markup);
    		}//success callback
    	});//$.ajax end
    	console.log(val);
    	
    	//sidoCd는 name의 값
    	const sidoCd = $("#sidoCd").val();
    	//gugun은 name의 값
    	const gugun = $("#gugun").val();
    	
    	//배열 7번지에 true를 넣음
    	validArr[7] = true;
    	
    	//가입하기 버튼 활성화 확인 함수
        checkValid();
    	
    })//#sido change

    //유효성 검사 되었나 확인하는 메서드 (중복된 코드가 있으면 함수로 빼세요)
    //배열 안의 값이 true인지 확인한다.
    //유효성 검사 모두 통과하면 가입하기 버튼 클릭(submit)
    function checkValid() {

        let count = 0;
        //i가 배열 개수보다 작으면
        for (let i = 0; i < validArr.length; i++) {
            //배열 번호 1씩 증가
            if (validArr[i]) count++;
        }//for end

        console.log(validArr);

        //만약 true 값이 배열 개수랑 같으면
        if (count == validArr.length) {

            //가입하기 버튼 활성화
            $("#joinBtn").attr("disabled", false);

        } else {

            $("#joinBtn").attr("disabled", true);

        }//if~else end

    }//checkValid() end
    
    $("#joinBtn").on("click", function(){
    	alert("회원가입이 완료되었습니다.\n로그인 후 홈페이지 이용이 가능합니다.\n다시 로그인해주세요.")
    })


    

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