<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>페리아 참가하기</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<link rel="stylesheet" href="css/biberesist.css">
<link rel="stylesheet" href="css/tui-date-picker.css">
<link rel="stylesheet" href="css/tui-editor.css">
<link rel="stylesheet" href="css/tui-editor-contents.css">
<style>
</style>

</head>
<body>
	<!--팝업-->
	<div id="wrapPopupCocktail">

		<div class="wrap_bibe_search">
			<!--wrap_search_bibe-->
			<div class="search_bar">
				<input type="text" id="inputSearch" name="bibeName"
					placeholder="비베 이름을 입력해 주세요." autocomplete="off">
				<button class="btn_search" type="button">검색</button>
			</div>
			<div class="wrap_result_search">
				<h5>검색 결과</h5>
				<!--wrap_result_search-->
				<ul class="list_item_search_bibe">
					<!--list_result_search-->

				</ul>
			</div>
		</div>
		<!--팝업 end-->
	</div>
	<c:import url="/WEB-INF/template/header.jsp"></c:import>
	<div id="wrapContent">
		<h2 class="first_header">비베 등록</h2>
		<h3 class="second_header">호스트와 함께 마실거리, 비베를 등록해보세요.</h3>
		<div class="bibe_resist_formbox">
			<form action="/bibeResist.feria" method="post" id="bibeInsertForm" >
			<input type="hidden" id="bibeDetail" name="bibeDetail">
				<fieldset>
					<legend class="screen_out">비베 등록 폼박스</legend>
					<div class="wrap_bibe_category">
						<h3 class="mid_header">비베의 종류를 선택해주세요.</h3>
						<div class="bibe_category">
							<input type="radio" name="bTypeNo" value="1"
								class="btn_filter no" id="soju" checked> <label
								for="soju">소주</label> <input type="radio" name="bTypeNo"
								value="2" class="btn_filter no" id="beer"> <label
								for="beer">맥주</label> <input type="radio" name="bTypeNo"
								value="3" class="btn_filter no" id="traditional"> <label
								for="traditional">전통주</label> <input type="radio" name="bTypeNo"
								value="4" class="btn_filter no" id="whisky"> <label
								for="whisky">양주</label> <input type="radio" name="bTypeNo"
								value="5" class="btn_filter" id="cocktail"> <label
								for="cocktail">칵테일</label> <input type="radio" name="bTypeNo"
								value="6" class="btn_filter no" id="fruit"> <label
								for="fruit">과실주</label> <input type="radio" name="bTypeNo"
								value="7" class="btn_filter no" id="etcbibe"> <label
								for="etcbibe">기타</label> <input type="radio" name="bTypeNo"
								value="8" class="btn_filter" id="garnish"> <label
								for="garnish">가니쉬</label>
						</div>
					</div>
					<div class="wrap_bibe_img_info">
						<h3 class="mid_header">비베의 정보를 입력해주세요.</h3>
						<div class="wrap_bibe_img">
							<dl class="bibe_img">
								<dt>사진</dt>
								<dd>
									<img src="" id="bibeOkImg"> <input type="hidden"
										name="bibeImg" id="profileName"> <input type="file"
										name="bibeImg" id="bibeImg" accept="image/*"> <label
										for="bibeImg"></label>
									<p class="bibe_img_msg msg">*사진을 등록해주세요.</p>
								</dd>
							</dl>
						</div>
						<div class="wrap_bibe_info">
							<div class="bibe_name">
								<h4 class="screen_out">도수 및 제조사</h4>
								<dl>
									<dt>이름</dt>
									<dd class="ok_img">
										<input type="text" name="bibeName" id="bibeName"
											placeholder="이름을 입력하세요."> <label for="bibeName"></label>
										<p class="bibe_name_msg msg"></p>
									</dd>
								</dl>
							</div>
							<div class="no_cocktail_garnish">
								<div class="bibe_percent_brand">
									<h4 class="screen_out">도수 및 제조사</h4>
									<dl>
										<dt>도수</dt>
										<dd class="bibe_percent">
											<input type="text" name="bibeAVB" id="bibePercent"
												placeholder="도수를 입력하세요." value="1.0"> <label for="bibePercent"></label>
											<p class="bibe_percent_msg msg"></p>
										</dd>
										<dt>제조사</dt>
										<dd class="bibe_brand">
											<input type="text" name="bibeBrand" id="bibeBrand"
												placeholder="제조사를 입력하세요." value=""> <label for="bibeBrand"></label>
											<p class="bibe_brand_msg msg"></p>
										</dd>
									</dl>
								</div>
								<div class="bibe_ml_price">
									<h4 class="screen_out">용량 및 가격</h4>
									<dl>
										<dt>용량</dt>
										<dd class="bibe_ml">
											<input type="text" name="bibeMl" id="bibeMl"
												placeholder="용량을 입력하세요.(단위:ml)" value="0"> <label for="bibeMl"></label>
											<p class="bibe_ml_msg msg"></p>
										</dd>
										<dt>가격</dt>
										<dd class="bibe_price">
											<input type="text" name="bibePrice" id="bibePrice" value="0"
												placeholder="가격을 입력하세요.(단위: 원)"> <label
												for="bibePrice"></label>
											<p class="bibe_price_msg msg"></p>
										</dd>
									</dl>
								</div>
								<button class="btn_add" type="button"></button>
							</div>
							<!--//no_cocktail_garnish-->
							<div class="wrap_ing">
								<div class="wrap_cocktailcup">
									<img src="img/cup2.png" alt="유리컵">
									<div id="ratio">
										<strong>0</strong>%
									</div>
								</div>
								<!--wrap_cocktailcup-->
								<button class="btn_add_ing" type="button">칵테일 재료 추가</button>
							</div>
							<!--//wrap_ing-->
						</div>
					</div>
					<div class="wrap_bibeEditor">
						<button type="button" class="btn_editor">상세 정보 입력</button>
						<div id="bibeEditor"></div>
					</div>
					<div class="wrap_btn">
					 <!-- <button style="position: absolute; left: 0;">TEST</button> -->
						<button class="btn_cancle" type="reset">취소</button>
						<button class="btn_next" type="submit">입력</button>
					</div>
				</fieldset>
			</form>
		</div>
	</div>

	<c:import url="/WEB-INF/template/footer.jsp"></c:import>
	<script src="js/tui-editor-Editor-full.js"></script>
	<script src="js/jquery.js"></script>
	<script src="js/underscore-min.js"></script>

	<script type="text/template" id="bibeAddTmpl">
    <div class="bibe_ml_price">
        <h4 class="screen_out">용량 및 가격</h4>
        <dl>
            <dt>용량</dt>
            <dd class="bibe_ml">
                <input type="text" name="bibeMl" placeholder="용량을 입력하세요." value="0">
                <label for="bibeMl"></label>
                <p class="bibe_ml_msg msg">*1~6자리의 숫자로 입력해주세요.</p>
            </dd>
            <dt>가격</dt>
            <dd class="bibe_price">
                <input type="text" name="bibePrice" placeholder="용량을 입력하세요." value="0">
                <label for="bibePrice"></label>
                <p class="bibe_price_msg msg">*숫자로 입력해주세요.</p>
            </dd>
        </dl>
        <button class="btn_delete_bibe delete" type="button"></button>
    </div>
</script>

	<!-- 칵테일에 대한 템플릿  -->
	<script type="text/template" id="ingAddTmpl">
    <div class="wrap_ing_add" id="wrap_ing<@=imgIdx@>">
        <h4>칵테일 재료 <@=imgIdx@></h4>
        <div class="wrap_ing_img_name">
            <div class="wrap_ing_img">
                <dl class="ing_img">
                    <dt>사진</dt>
                    <dd>
						<div class="wrap_ing_bibeImg">
                        <img class="ing_bibe_img" src="/img/<@=bibeImg@>">
						</div>
                        <input type="hidden" name="bibeIng" value="<@=bibeNo@>">
                    </dd>
                </dl>
            </div><!--//wrap_ing_img-->
            <div class="ing_name_percent">
                <div class="ing_name">
                    <h4 class="screen_out">이름</h4>
                    <dl>
                        <dt>재료명</dt>
                        <dd class="ok_img">
                            <input type="text" name="ingName" value="<@=bibeName@>" id="ingName<@=imgIdx@>"  readonly>
                            <label for="ingName<@=imgIdx@>"></label>
                        </dd>
                    </dl>
                </div><!--ing_name-->
                <div class="ing_percent">
                    <h4 class="screen_out">비율</h4>
                    <dl>
                        <dt>비율</dt>
                        <dd class="ok_img">
                            <input type="text" class="ratio input" data-idx="<@=imgIdx+1@>" name="ingRatio" placeholder="비율을 입력하세요.">
                            <p class="ing_Percent_msg msg"></p>
                        </dd>
                    </dl>
                </div><!--//ing_percent-->
            </div><!--//ing_name_percent-->
            <button class="btn_delete_ing delete" type="button"></button>
        </div>
    </div><!--wrap_ing_add-->
</script>


	<script type="text/template" id="itemSearchBibe">
    <@_.each(searchBibes,function(bibe) {@>
    <li class="item_bibe_detail" data-bibeno="<@=bibe.bibeNo@>"
        data-bibeImg = "<@=bibe.bibeImg@>"
        data-bTypeNo = "<@=bibe.btypeNo@>"
        data-bibeName = "<@=bibe.bibeName@>"><!--item_result_search-->
        <img src="/img/<@=bibe.bibeImg@>" alt="비베 이미지"><span><@=bibe.bibName@></span>
    </li>
    <@})@>
</script>


	<script type="text/template" id="ingTmpl">
    <div id="ing<@=imgIdx@>" class="ing"></div>
</script>

	<script>
		_.templateSettings = {
			interpolate : /\<\@\=(.+?)\@\>/gim,
			evaluate : /\<\@([\s\S]+?)\@\>/gim,
			escape : /\<\@\-(.+?)\@\>/gim
		};

		//비베 검색 ajax
		$inputSeacrch = $("#inputSearch");
		$wrapListResult = $(".list_item_search_bibe");
		$resultBibeTmp = _.template($("#itemSearchBibe").html());

		$inputSeacrch.keyup(function() {

			const bibeName = $(this).val();//파라미터값 저장변수 선언
			console.log(bibeName);
			if (bibeName.length > 0) {
				$.ajax({

					type : "get",
					url : "/ajax/searchBibe.feria",
					data : {
						bibeName : bibeName
					}, //파라미터
					error : function() {
						alert("점검중")
					},//error end
					success : function(json) {

						$wrapListResult.html($resultBibeTmp({
							searchBibes : json
						}));

					}//success end
				})
			} else {
				//console.log("else");
				$wrapListResult.empty();
			}
		});

		//유효성 검사
		//비베 이름 요소
		const $bibeName = $("#bibeName");
		//도수
		const $bibePercent = $("#bibePercent");
		//제조사
		const $bibeBrand = $("#bibeBrand");
		//사진틀
		const $bibeImg = $("#bibeImg+label");
		//사진틀2
		const $bibeImg2 = $("#bibeImg");
		//사진
		const $bibeOkImg = $("#bibeOkImg");
		//입력버튼 jquery객체
		const $btnNext = $(".btn_next");
		//용량 가격 부모 jquery 객체
		const $wrap_bibe_img_info = $(".wrap_bibe_img_info");
		//칵테일 컵 객체
		const $wrapCocktailcup = $(".wrap_cocktailcup");

		const $wrapBibeSearch = $(".wrap_bibe_search");

		//칵테일인덱스
		let imgIdx = 0;
		// 칵테일이미지 인덱스
		let ingIdx = 0;

		let heightArr = [];

		//칵테일버튼 jquery객체
		const $cocktail = $("#cocktail")
		//추가버튼 객체
		const $btnAdd = $(".btn_add");
		const $btnAddIng = $(".btn_add_ing");

		const $noCocktailGarnish = $(".no");

		const $garnish = $("#garnish");

		//비베이름 정규표현식 객체
		const bibeNameRegExp = /^[가-힣|\w|\d]{1,40}$/;
		//도수 정규표현식 객체
		const bibePercentRegExp = /^\d{1,2}$/;
		//재료 정규표현식 객체
		const ingPercentRegExp = /^\d{1,3}$/;
		//제조사 정규표현식 객체
		const bibeBrandRegExp = /^[가-힣|\w|\d]{1,20}$/;
		//용량 정규표현식 객체
		const bibeMlRegExp = /^\d{1,6}$/;
		//가격 정규표현식 객체
		const bibePriceRegExp = /^\d{1,14}$/;
		//비베 카테고리 정규표현식 객체
		const bibeImageRegExp = /^image\//;
		//재료 카테고리 정규표현식 객체
		const ingImageRegExp = /^image\//;

		//비베사진 메시지
		const $bibeImgMsg = $(".bibe_img_msg");
		//비베 메시지 요소
		const $bibeNameMsg = $(".bibe_name_msg");
		//도수 메시지
		const $bibePercentMsg = $(".bibe_percent_msg");
		//제조사 메시지
		const $bibeBrandMsg = $(".bibe_brand_msg");

		//2020-08-02 김필구 : 칵테일유리병에 퍼센트 표시하는 strong요소
		const $ratio = $("#ratio strong");

		//유효성 검사 확인값 배열
		//1번지에는 비밀번호 확인값(기본값 false)
		let validArr = [ false, false, false, false, false, false ];

		//0번지에는 닉네임확인값(기본값은 false)

		//용량 가격 입력 폼 추가
		const bibeTmp = _.template($("#bibeAddTmpl").html());
		$btnAdd.click(function() {
			$btnAdd.before(bibeTmp);
			validArr.push(false);
			console.log(validArr);
			testValid();
		});

		/*높이 값 합계 함수*/
		function sumArr() {
			let sum = 0;
			for (let i = 0; i < heightArr.length; i++) {
				sum += parseInt(heightArr[i]);
			}
			return sum;
		};

		$wrapPopupCocktail = $("#wrapPopupCocktail");

		//재료 입력 폼 추가
		const ingAddTmpl = _.template($("#ingAddTmpl").html());
		const ingTmpl = _.template($("#ingTmpl").html());

		$btnAddIng.click(function() {
			$wrapPopupCocktail.css("display", "block");

		});

		const $noCG = $(".no_cocktail_garnish");
		$noCG.on("click", ".btn_delete_bibe", (function() {
			$noCG.children('.bibe_ml_price').last().remove();
			validArr.pop();
			testValid();
		}));

		const $wrapIng = $(".wrap_ing");
		$wrapIng.on("click", ".btn_delete_ing", (function() {
			$(this).parents('.wrap_ing_add').remove();
			validArr.pop();
			imgIdx--;
			ingIdx--;
			console.log("btndeletebibe")
			console.log("img : " + imgIdx);
			console.log("ing : " + ingIdx);
			if (imgIdx == 0) {
				$wrapCocktailcup.css("display", "none");
			}
			testValid();
		}));

		//상세 정보 에디터
		const editor = new tui.Editor({
			el : document.querySelector('#bibeEditor'),
			previewStyle : 'vertical',
			height : 600,
			initialEditType : 'wysiwyg',
			language : 'ko_KR'
		});
		
		//2020.08.09
		//bibeEditor submit
		const $bibeDetail = $("#bibeDetail");
		
		$("#bibeInsertForm").submit(function(e) {
			
			
			const contents = editor.getHtml();
			
			console.log(contents);
	      

	      //  const text = $(".te-editor").text();
	     //  const contents = $(".te-editor");
	        
	       // console.log("text:"+text);
	      //  console.log(contents);
	        
	       // if (text.length <= 0) {
	     //       alert("내용을 입력하세요.");
	     //       return false;
	    //    }//if end

	        $bibeDetail.val(contents);

	        return true;

	    });//submit() end

		//에디터 하이드 앤 쇼 토글
		const $bibeEditor = $("#bibeEditor");
		$(".btn_editor").click(function() {
			$bibeEditor.toggle();
		});

		//비베이미지 검사
		$($bibeImg2).change(
				function() {
					const bibeImage = this.files[0];
					validArr[0] = bibeImage.size > 0
							&& bibeImageRegExp.test(bibeImage.type);
					if (validArr[0]) {
						$bibeImgMsg.text("*사진이 등록되었습니다.").addClass("ok");
						$bibeImg.css("display", "none");
						$bibeOkImg.css("display", "block");
					} else {
						$bibeImgMsg.text("*이미지 파일을 등록해주세요.").removeClass("ok");
						$bibeImg.css("display", "block");
						$bibeOkImg.css("display", "none");
					}
					testValid();
					//ajax로 파일업로드
					//2020.08.09
					//이원희 추가.
					const formData = new FormData();

					//파일을 append시킴
					//append(명,값) : 일반 파라미터
					//append(명,파일 , 파일명) : 파일업로드
					//formData.append("img","test");
					formData.append("upload", bibeImage, bibeImage.name);

					$.ajax({

						url : "ajax/uploadImage.feria",
						type : "post",
						dataType : "json",
						contentType : false,//multipart/form-data니까
						processData : false,//multipart/form-data니까
						data : formData,//multipart/form-data니까
						error : function() {
							alert("서버점검중!");
						},
						success : function(json) {
							console.log(json);

							//유저에게 미리보기 제공
							$bibeOkImg.attr("src", "/upload/" + json.src);

							//join.jbp에 넘어갈 사진이름을 세팅
							$("#profileName").val(json.src);
						}

					})//ajax end
				});

		//비베 이름
		$bibeName.keyup(function() {
			const bibeName = $bibeName.val();
			validArr[1] = bibeNameRegExp.test(bibeName);
			if (validArr[1]) {
				$bibeNameMsg.text("등록 가능한 비베 이름입니다.").addClass("ok");
				$bibeName.addClass("ok");
			} else {
				$bibeNameMsg.text("*1~40자 한글, 영문, 숫자로 비베 이름을 등록해주세요!")
						.removeClass("ok");
				$bibeName.removeClass("ok");
			}//if~else end
			testValid();
		});//$nickname.keyup() end

		$listItemSearchBibe = $(".list_item_search_bibe");

		//여기
		$listItemSearchBibe.on("click", ".item_bibe_detail", function() {

			const bibeNo = this.dataset.bibeno;
			const bibeImg = this.dataset.bibeimg;
			const bibeName = this.dataset.bibename;

			const height = $(".ratio:last").val();

			if (!isNaN(height)) {
				heightArr.push(parseInt(height));
				$(".ratio:last").removeClass("input").attr("readonly", true)
						.next().remove();
			}

			$(".wrap_cocktailcup").before(ingAddTmpl({
				imgIdx : ++imgIdx,
				bibeNo : bibeNo,
				bibeImg : bibeImg,
				bibeName : bibeName
			}));
			$(".wrap_cocktailcup img").before(ingTmpl({
				ingIdx : ++ingIdx
			}));
			const nowHeight = sumArr();
			const nowColor = "#"
					+ Math.round(Math.random() * 0xFFFFFF).toString(16);
			$(".wrap_cocktailcup #ing" + ingIdx).css({
				"transform" : "translateY(-" + nowHeight + "px)",
				"background-color" : nowColor
			});

			$wrapPopupCocktail.hide();
			$wrapListResult.empty();
			$inputSeacrch.val("");

			validArr.push(false);
			testValid();

			$wrapCocktailcup.show();

		})

		//재료 비율
		$(".wrap_bibe_info").on(
				"keyup",
				".ing_percent .input.ratio",
				function() {

					//this(ingPercent)의 값 받아옴.

					const value = $(this).val();

					if (!ingPercentRegExp.test(value)) {
						$(this).val("").next().text("*0에서 100까지의 비율을 입력해주세요.")
								.removeClass("ok");

						return;
					}

					let ingPercent = parseInt($(this).val());

					console.log("ingPercent:" + ingPercent);
					console.log(isNaN(ingPercent));
					if (isNaN(ingPercent)) {
						console.log("ingPercent가 숫자가 아님");
						ingPercent = 0;
					}

					//현재 인풋의 인덱스 값 받아옴(유효성 배열 3번째칸(2번지)부터 차례로 트루로 채우기 위함.)
					const nowIdx = this.dataset.idx;

					console.log("nowIdx:" + nowIdx);

					//높이 합계 배열 + this에 입력한 값. 현재 몇 퍼센트인지 보기 위함.
					const nowHeight = sumArr() + ingPercent;

					console.log("idx:" + nowIdx);
					//유효성검사배열 : 0~99이내의 숫자인지 검사하고 현재 높이가 100보다 작거나 같은지 검사.
					validArr[nowIdx] = nowHeight <= 100;

					$ratio.text(nowHeight);

					if (validArr[nowIdx]) {
						$(this).next().text("*입력 가능합니다.").addClass("ok");
						$(this).addClass("ok");
						$(this).parents("body").find("#ing" + imgIdx).css(
								"height", ingPercent);
						$ratio.parent().css("color", "#fff");
						$btnAddIng.css("visibility", "visible");
					} else {
						$(this).next().text("*0에서 100까지의 비율을 입력해주세요.")
								.removeClass("ok");
						$(this).removeClass("ok");
						$ratio.parent().css("color", "red");
						$btnAddIng.css("visibility", "hidden");
					}//if~else end

					if (nowHeight == 100) {
						$btnAddIng.css("visibility", "hidden");
					}//if end

					testValid2();
					//ajax로 파일업로드
				});

		//비베 도수
		$bibePercent.keyup(function() {
			const bibePercent = $(this).val();
			const nowIdx = $(this).parents(".bibe_percent_brand").index() + 2;
			console.log($(this).parents(".bibe_percent_brand"));
			console.log("idx:" + nowIdx);
			validArr[nowIdx] = bibePercentRegExp.test(bibePercent);
			if (validArr[nowIdx]) {
				$bibePercentMsg.text("*입력 가능합니다.").addClass("ok");
				$bibePercent.addClass("ok");
			} else {
				$bibePercentMsg.text("*0에서 99까지의 도수를 입력해주세요.")
						.removeClass("ok");
				$bibePercent.removeClass("ok");
			}//if~else end
			testValid();
		});//$bibePercent.keyup() end

		$bibeBrand.keyup(function() {
			const bibeBrand = $(this).val();
			const nowIdx = $(this).parents(".bibe_percent_brand").index() + 3;
			console.log($(this).parents(".bibe_percent_brand"));
			console.log("idx:" + nowIdx);
			validArr[nowIdx] = bibeBrandRegExp.test(bibeBrand);
			if (validArr[nowIdx]) {
				$bibeBrandMsg.text("입력 가능합니다.").addClass("ok");
				$bibeBrand.addClass("ok");
			} else {
				$bibeBrandMsg.text("*1~20자 한글, 영문, 숫자로 입력해주세요.").removeClass(
						"ok");
				$bibeBrand.removeClass("ok");
			}//if~else end
			testValid();
		});//$bibeBrand.keyup() end

		$($wrap_bibe_img_info).on("keyup", ".bibe_ml input", function() {
			const bibeMl = $(this).val();
			const nowIdx = $(this).parents(".bibe_ml_price").index() + 3;
			console.log($(this).parents(".bibe_ml_price"));
			console.log("idx:" + nowIdx);
			validArr[nowIdx] = bibeMlRegExp.test(bibeMl);
			if (validArr[nowIdx]) {
				//맞을때
				$(this).next().next().text("*입력 가능합니다.").addClass("ok");
				$(this).addClass("ok");
				//유효성검사 통과니까
			} else {
				$(this).next().next().text("*숫자로 입력해주세요.").removeClass("ok");
				$(this).removeClass("ok");
			}//if~else end
			testValid();
		});//$wrap_bibe_img_info.keyup() end

		$($wrap_bibe_img_info).on("keyup", ".bibe_price input", function() {
			const bibePrice = $(this).val();
			const nowIdx = $(this).parents(".bibe_ml_price").index() + 4;
			console.log($(this).parents(".bibe_ml_price"));
			console.log("idx:" + nowIdx);
			validArr[nowIdx] = bibePriceRegExp.test(bibePrice);
			if (validArr[nowIdx]) {
				//맞을때
				$(this).next().next().text("*입력 가능합니다.").addClass("ok");
				$(this).addClass("ok");
				//유효성검사 통과니까
			} else {
				$(this).next().next().text("*숫자로 입력해주세요.").removeClass("ok");
				$(this).removeClass("ok");
			}//if~else end
			testValid();
		});//$nickname.keyup() end

		function testValid() {
			//validArr에 true값이 몇 개인지 확인
			console.log(validArr);
			let count = 0;
			for (let i = 0; i < validArr.length; i++) {
				if (validArr[i])
					count++;
			}//for end
			console.log(count);
			if (count == validArr.length) {
				$btnNext.attr("disabled", false).css({
					"background-color" : "#e65100",
					"border-color" : "#e65100",
					"color" : "#fff"
				});
			} else {
				$btnNext.attr("disabled", true).css({
					"background-color" : "#dddddd",
					"border-color" : "#424242",
					"color" : "#424242"
				});

			}//
		};//testValid() end

		function testValid2() {
			const height = parseInt($(".ratio:last").val());
			const nowHeight = sumArr() + height;
			//validArr에 true값이 몇 개인지 확인
			console.log(validArr);
			let count = 0;

			for (let i = 0; i < validArr.length; i++) {
				if (validArr[i])
					count++;
			}//for end

			console.log("count : " + count);
			console.log("nowHeight : " + nowHeight);
			if (count == validArr.length && nowHeight == 100) {
				$btnNext.attr("disabled", false).css({
					"background-color" : "#e65100",
					"border-color" : "#e65100",
					"color" : "#fff"
				});
			} else {
				$btnNext.attr("disabled", true).css({
					"background-color" : "#dddddd",
					"border-color" : "#424242",
					"color" : "#424242"
				});

			}//
		};//testValid() end

		//칵테일, 가니쉬 제외 클릭
		$noCocktailGarnish.click(function() {
			$(".wrap_ing").hide();
			$(".no_cocktail_garnish").show();
			makeValidArr(3);
		});

		$cocktail.click(function() {
			$(".no_cocktail_garnish").hide();
			$(".wrap_ing").show();
			makeValidArr(2);
		});//cocktail click() end

		$garnish.click(function() {
			$(".wrap_ing").hide();
			$(".no_cocktail_garnish").hide();
			makeValidArr(1);
		});//cocktail click() end

		// 유효성검사를 위한 array를 만드는 함수
		function makeValidArr(cmd) {
			switch (cmd) {
			case 1:
				//가니쉬 일때
				validArr = [ false, false ];
				break;
			case 2:
				//칵테일일때
				validArr = [ false, false ];
				/*
				 $(".wrap_ing").each(function (idx) {
				 const ingImg = $(this).find(".ing_img input")[0].files[0];
				 console.log(ingImg);
				 const nowIdx = $(this).index();
				 console.log(idx+":"+nowIdx)
				 //const ingName = $(this).find(".ing_name input").val();
				 const ingPercent = $(this).find(".ing_percent input").val();
				 validArr[nowIdx] = /*ingImg.size > 0 && ingImageRegExp.test(ingImg.type) && ingPercentRegExp.test(ingPercent);
				 });
				 */
				break;
			default:
				//이때는 칵테일, 가니쉬가 아님
				validArr = [ false, false, false, false, false, false ];

				const bibePercent = $("#bibePercent").val();

				console.log("bibePercent:" + bibePercent);

				validArr[2] = bibePercentRegExp.test(bibePercent);

				const bibeBrand = $("#bibeBrand").val();

				validArr[3] = bibeBrandRegExp.test(bibeBrand);

				$(".bibe_ml_price")
						.each(
								function(idx) {

									const bibeMl = $(this).find(
											".bibe_ml input").val();
									const nowIdx = $(this).index() + 3;
									console.log(idx + ":" + nowIdx);
									const bibePrice = $(this).find(
											".bibe_price input").val();

									validArr[nowIdx] = bibeMlRegExp
											.test(bibeMl)
											&& bibePriceRegExp.test(bibePrice);

								});
			}
			const bibeImage = $("#bibeImg")[0].files[0];
			if (bibeImage) {
				validArr[0] = bibeImage.size > 0
						&& bibeImageRegExp.test(bibeImage.type);
			}
			const bibeName = $bibeName.val();
			if (bibeName) {
				validArr[1] = bibeNameRegExp.test(bibeName);
			}
			testValid();
		};//makeValidArr() end
	</script>
</body>
</html>