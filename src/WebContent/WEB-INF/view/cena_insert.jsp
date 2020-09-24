<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Feria | 세나등록</title>
    <!--  reset.css  -->
    <link rel="stylesheet" href="css/reset.css"/>
    <!--  notosanskr.css  -->
    <link rel="stylesheet" href="css/notosanskr.css"/>
    <!--  favicon 설정  -->
    <link rel="icon" href="img/logo.ico"/>
    <!-- 폰트어썸 아이콘 -->
    <link rel="stylesheet" href="css/all.min.css">
    <!-- header.css -->
    <link rel="stylesheet" href="css/header.css"/>
    <!-- small_header.css -->
    <link rel="stylesheet" href="css/small_header.css">
    <!-- allergy.css -->
    <link rel="stylesheet" href="css/allergy.css">
    <!-- cena_insert.css -->
    <link rel="stylesheet" href="css/cena_insert.css">
    <c:import url="/WEB-INF/template/link.jsp"></c:import>

</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"></c:import>
<div id="wrapContent">
    <h2 class="first_header">세나 등록</h2>
    <h3 class="second_header">자신 있는 요리를 세나로 등록하여 손님을 맞이해보세요.</h3>

    <div id="insertCena">
        <form action="/cenaInsert.feria" method="post">
        <input type="hidden" name="userNo" value="">
        <input type="hidden" name="cenaImgName" id="cenaImgName" value="">
            <fieldset>
                <legend class="screen_out">세나 등록 폼</legend>
                <div class="insert_cena_left not">
                    <label for="cenaName" class="screen_out"></label>
                    <input autocomplete="off" class="title_cena" id="cenaName" type="text" name="cenaName"
                           placeholder="세나의 제목을 입력하세요." style="outline: none"
                           title="제목을 입력하세요."/>
                    <!--이미지 등록-->
                    <div class="plus_image_cena">
                        <input autocomplete="off" type="file" id="insertCenaImg" name="cenaImg"
                               accept="image/*">
                        <label for="insertCenaImg"></label>
                        <img id="cenaImg" src="img/kim.jpg"/>
                        <button class="btn_remove" type="button"><i class="fa fa-times"></i></button>
                    </div><!--//이미지 등록-->
                    <p class="not cena_img_msg msg">사진을 등록해주세요.</p>
                </div><!--//.insert_cena_left-->
                <div class="insert_cena_right">
                    <div class="cena_kategorie_food">
                        <input checked id="korean" type="radio" name="mealType" value="K"><label for="korean" class="label_K">한식</label>
                        <input id="chinese" type="radio" name="mealType" value="C"><label for="chinese" class="label_C">중식</label>
                        <input id="japanese" type="radio" name="mealType" value="J"><label for="japanese" class="label_J">일식</label>
                        <input id="asian" type="radio" name="mealType" value="A"><label for="asian" class="label_A">아시안</label>
                        <input id="western" type="radio" name="mealType" value="W"><label for="western" class="label_W">양식</label>
                    </div><!--//.cena_kategorie_food-->
                    <div class="wrap_input_allergy">
                        <h4>알레르기 유발 식품 선택</h4>
                        <div class="allergy_img">
                            <input type="checkbox" name="allergy" value="1" class="allergy_check" id="allergy1">
                            <label for="allergy1"></label>
                            <input type="checkbox" name="allergy" value="2" class="allergy_check" id="allergy2">
                            <label for="allergy2"></label>
                            <input type="checkbox" name="allergy" value="3" class="allergy_check" id="allergy3">
                            <label for="allergy3"></label>
                            <input type="checkbox" name="allergy" value="4" class="allergy_check" id="allergy4">
                            <label for="allergy4"></label>
                            <input type="checkbox" name="allergy" value="5" class="allergy_check" id="allergy5">
                            <label for="allergy5"></label>
                            <input type="checkbox" name="allergy" value="6" class="allergy_check" id="allergy6">
                            <label for="allergy6"></label>
                            <input type="checkbox" name="allergy" value="7" class="allergy_check" id="allergy7">
                            <label for="allergy7"></label>
                            <input type="checkbox" name="allergy" value="8" class="allergy_check" id="allergy8">
                            <label for="allergy8"></label>
                            <input type="checkbox" name="allergy" value="9" class="allergy_check" id="allergy9">
                            <label for="allergy9"></label>
                            <input type="checkbox" name="allergy" value="10" class="allergy_check" id="allergy10">
                            <label for="allergy10"></label>
                            <input type="checkbox" name="allergy" value="11" class="allergy_check" id="allergy11">
                            <label for="allergy11"></label>
                            <input type="checkbox" name="allergy" value="12" class="allergy_check" id="allergy12">
                            <label for="allergy12"></label>
                        </div><!--//.allergy_img-->
                    </div><!--//.wrap_input_allergy-->
                    <div class="host_msg not">
                        <h4>호스트 한마디<span class="star"></span></h4>
                        <textarea placeholder="ex) 군대 취사병 출신, 파스타만큼은 정말 자신있습니다 !"
                                  name="hostCmt" style="outline: none" id="hostMsg" title="한마디를 입력해주세요."></textarea>
                    </div><!--//.host_msg-->
                </div><!--//.insert_cena_right-->
                <div class="insert_cena_bottom">
                    <div class="kind_cena">
                        <h4>세나 종류 선택</h4>
                        <input checked type="radio" name="cenaType" value="B" class="kind_check" id="bs">
                        <label for="bs"> 밥상</label>
                        <input type="radio" name="cenaType" value="S" class="kind_check" id="ss">
                        <label for="ss"> 술상</label>

                        <!--<p class="cena_kind_msg msg">세나 종류를 선택해주세요.</p>-->
                    </div><!--//.kind_cena-->
                    <div id="commTagBox" class="food_tags not">
                        <h4>요리<span class="star"></span></h4>
                        <ul id="putItem" class="plus_tag_food">
                            <li id="insertTagBox">
                            	<input autocomplete="off" id="insertTag" style="outline: none" placeholder="태그입력" name="tag"/>
                            	<ul id="itemList"></ul>
							</li>
                        </ul><!--//.plus_tag_food-->
                    </div><!--//.food_tags-->
                    <div class="btn_enrollment">
                        <button class="btn" type="submit" id="enrollmentBtn">등록</button>
                    </div><!--//.btn_enrollment-->
                </div><!--//.insert_cena_bottom-->
            </fieldset>
        </form>
    </div><!--//#insertCena-->
</div><!--//#wrapContent-->

<script type="text/template" id="tagListTmpl">
    <li  class="list_put_tag">
    <input type="hidden" name="cookNo" value="<@=cook.cookNo@>" >
        #<span><@=cook.cookName@></span>
        <i class="fas fa-times"></i>
    </li>
</script>


<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script type="text/javascript">


_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

let cnt = 0;

const $insertTag = $("#insertTag");
const $itemList = $("#itemList");
const $putItem = $("#putItem");

const tmp = _.template($("#tagListTmpl").html());
let cookNoArr=[0, 0, 0];

/* =============================== 함수 ===============================*/
function cLoad(cookName) {
    $.ajax({
        url: "ajax/searchDishes.feria",
        type:"get",
        data:{cookName:cookName},
        dataType:"json",
        error: function () {
            //alert("에러");
        },
        success: function (json) {
            $itemList.empty();
            //console.log(json.cook);
            const cookLength=json.cook.length;
            console.log(cookLength);
            $.each(json.cook,function(index,item){
            	console.log("cookNo : "+item.cookNo);
            	console.log("cookName : "+item.cookName);
            	const $li=$("<li>").text(item.cookName);
            	$("#itemList").append($li);
            })
            
        }
    });
}

function putTag(text){
	
	$.ajax({
		url : "/ajax/insertDishes.feria",
		type : "POST",
		dataType : "json",
		data : {cookName : text},
		error : function () {
			alert("점검 중");
		},
		success : function (json) {
			 console.log(json.cook);
			 $("#insertTagBox").before(tmp({cook:json.cook}));
		}
	});
}

/* =============================== event ===============================*/
$insertTag.keydown(function (event){
	
	cnt=$("#putItem>li").length;
	console.log("cnt : "+cnt);
    const inputStr = $insertTag.val();
    //let dishName = "";
    console.log(inputStr);
    // 10글자 이상 입력 못하도록
    if(inputStr.length > 10){
        $insertTag.val(inputStr.slice(0, 10));
    }
	
    if (parseInt(cnt) <= 3) {
        if (event.keyCode == 13) {  //키가 13(엔터)이면 실행
            event.preventDefault();
        
            // 띄어쓰기 없앰
            tagTxt = $insertTag.val().replace(/ /gi, "");
            validArr[3] = tagRegExp.test(tagTxt);
            console.log("tagTxt : "+tagTxt);
            if (validArr[3]) {
            	
                putTag(tagTxt);
                if (cnt == 3) {
                	$("#insertTagBox").hide();
                    $insertTag.css("display", "none");
                }   
               $insertTag.val("");
            }
            $("#itemList").empty();
            //cLoad(tagTxt);
            console.log("cnt : " + cnt);
        } else {    // 글자 입력 시에
            cLoad(inputStr);
        }
    }
    //checkValid();
});

$itemList.on("click", "li", function () {
    //cLoad();    
    // 클릭시 input에 값 넘어가고 해당 글자랑 같은거만 보여주려고
	const cookName=$(this).text();
    console.log("li:cookName : "+cookName);
    $insertTag.val(cookName);

    $insertTag.focus();

});

$putItem.on("click", "li i", function () {
    $(this).parent().remove();
    cnt--;
    $("#insertTagBox").show();
    $insertTag.css("display", "inline-block");
    console.log("cnt : " + cnt);
});
</script>
<script>
	//_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

    //세나 제목 유효성 검사(1~20자, 공백 가능)
    const titleCenaRegExp = /^[가-힣|a-z|A-Z|\d|\s]{1,20}$/;
    //이미지 유효성 검사
    const cenaImageRegExp = /^image\//;
    //호스트 한마디 유효성 검사
    const hostMsgRegExp = /^[ㄱ-힣|a-z|A-Z|\d|\s]{1,200}$/;
    //요리태그 유효성 검사(한글, 숫자, 영어 가능, 1~10자, 중간에 공백 불가능)
    const tagRegExp = /^[가-힣|a-z|A-Z|\d]{1,10}$/;

    //세나 + 이미지 객체 생성
    const $plusImageCena = $(".plus_image_cena");

    //사진 틀
    const $insertCenaImg = $("#insertCenaImg+label");

    //사진 틀2
    const $cenaImg = $("#cenaImg");

    //유효성 검사 확인값(제목, 이미지, 한마디, 태그)
    const validArr = [false, false, false, false];


    /*세나 제목 입력*/
    $("#cenaName").keyup(function () {

        //입력한 제목 얻어옴
        const title = $(this).val();
        /*alert(title);*/

        //0번지에 유효성 검사 결과(true, false) 입력
        validArr[0] = titleCenaRegExp.test(title);

        //만약 배열 0번지가 유효성 통과하면(true)
        if (validArr[0]) {
            //제목 인풋에서 not클래스를 뺌
            $(this).parent().removeClass('not').addClass('ok');
        } else {
            //유효성 실패 시 not class 붙임
            $(this).parent().addClass('not').removeClass('ok');
        }//if~else end

        //등록 버튼 활성화 확인 함수
        //checkValid();

    });/*//#titleCena keyup()*/

    /*이미지 변경*/
    $("#insertCenaImg").change(function () {

        const cenaImage = this.files[0];

        validArr[1] = cenaImage.size > 0 && cenaImageRegExp.test(cenaImage.type);

        if (validArr[1]) {
            $plusImageCena.addClass("ok");
            $(".cena_img_msg").hide();
        } else {
            $plusImageCena.removeClass("ok");
            alert("이미지를 선택해주세요.")
        }

        //checkValid();
        
        //ajax로 파일업로드.
        const formData =
			new FormData();
        
        //formData.append("cenaImage","test");
		formData.append("cenaImage",cenaImage,cenaImage.name);
		
		$.ajax({
			url:"/ajax/uploadImage.feria",
			type:"post",
			dataType:"json",
			contentType:false,//multipart/form-data;
			processData:false,//multipart/form-data;
			data:formData,
			error:function(){
				alert("서버 점검 중");
			},
			success:function(json){
				console.log(json);
				//유저에게 미리보기 제공
				$("#cenaImg").attr("src","/img/cenaImage/"+json.cenaImg);
				
				//cenaInsert.jsp에 넘어갈 사진이름을 세팅
				$("#cenaImgName").val(json.cenaImg);
			}
		});//#ajax end
    });

    /*호스트 한마디 입력*/
    $("#hostMsg").keyup(function () {

        //입력한 한마디 얻어옴
        const msg = $(this).val();
        /*alert(msg);*/

        //2번지에 유효성 검사 결과(true, false) 입력
        validArr[2] = hostMsgRegExp.test(msg);

        //만약 배열 2번지가 유효성 통과하면(true)
        if (validArr[2]) {
            //제목 인풋에서 not클래스를 뺌
            $(this).parent().removeClass('not').addClass('ok');
        } else {
            //유효성 실패 시 not class 붙임
            $(this).parent().addClass('not').removeClass('ok');
        }//if~else end

        //등록 버튼 활성화 확인 함수
        checkValid();

    });/*//#hostMsg keyup()*/

    $(".btn_remove").on("click", function () {

        $("#insertCenaImg").val("");

        $(".cena_img_msg").show();

        $plusImageCena.removeClass("ok");
    });


    //ajax로 태그 자동완성된 걸 클릭하면 텍스트 들어가고 엔터치면 서버로 들어가도록
    //li를 얻

    //유효성 검사 되었나 확인하는 메서드 (중복된 코드가 있으면 함수로 빼세요)
    //배열 안의 값이 true인지 확인한다.
    //유효성 검사 모두 통과하면 등록 버튼 클릭(submit) 가능
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

            //등록 버튼 활성화
            $("#enrollmentBtn").attr("disabled", false);

        } else {

            $("#enrollmentBtn").attr("disabled", true);

        }//if~else end

    }//checkValid() end

/*     const $mealType=$(".cena_kategorie_food label");
    $mealType.click(function() {
    	const idx = ($(this).index());
    	console.log(idx);
    	$(this).parent().children("input").attr("checked",false);
    	$(this).parent().children("label").css({"background-color":"#fff","border-color":"#424242","color":"#424242"});
    	if(idx==1){
        	$(this).css({"background-color":"#0D47A1","border-color":"#0D47A1","color":"#fff"})
        	.prev().attr("checked",true);
    	}else if(idx==3){
        	$(this).css({"background-color":"#311B92","border-color":"#311B92","color":"#fff"})
        	.prev().attr("checked",true);
    	}else if(idx==5){
        	$(this).css({"background-color":"#B71C1C","border-color":"#B71C1C","color":"#fff"})
        	.prev().attr("checked",true);
    	}else if(idx==7){
        	$(this).css({"background-color":"#1B5E20","border-color":"#1B5E20","color":"#fff"})
        	.prev().attr("checked",true);
    	}else{
        	$(this).css({"background-color":"#5D4037","border-color":"#5D4037","color":"#fff"})
        	.prev().attr("checked",true);
    	}
    }) */
    const $mealType=$(".cena_kategorie_food label");
    $mealType.click(function() {
    	const idx = ($(this).index());
    	console.log(idx);
    	$(this).parent().children("input").attr("checked",false);
    	$(this).parent().children("label").removeClass('on');
    	if(idx==1){
        	$(this).addClass('on').prev().attr("checked",true);
    	}else if(idx==3){
        	$(this).addClass('on').prev().attr("checked",true);
    	}else if(idx==5){
        	$(this).addClass('on').prev().attr("checked",true);
    	}else if(idx==7){
        	$(this).addClass('on').prev().attr("checked",true);
    	}else{
        	$(this).addClass('on').prev().attr("checked",true);
    	}
    })
   /*  const $labelK=$(".cena_kategorie_food .label_K");
    $labelK.click(function() {
    	console.log($(this));
    	$(this).css({"background-color":"#304FFE","border-color":"#304FFE","color":"#fff"});
		$(this).prev().attr("checked",true);
	}) */
    
</script>
<c:import url="/WEB-INF/template/footer.jsp"></c:import>
</body>
</html>