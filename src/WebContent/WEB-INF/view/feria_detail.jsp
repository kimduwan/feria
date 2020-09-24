<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html> 
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="css/all.min.css" rel="stylesheet">
    <c:import url="/WEB-INF/template/link.jsp"></c:import>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/starrr.css">
    <!--하단 슬라이더용 링크-->
    <link rel="stylesheet" type="text/css" href="http://black-flag.net/data/css/reset.css">
    <!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
	<link rel="stylesheet" type="text/css" href="/css/feria_detail.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" >
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp"></c:import>
    <div id="wrapFeriaDetail">

        <!--https://dimsemenov.com/plugins/magnific-popup/-->
        <!--feria info-->
        <div class="feria_info">
            <div class="text_feria_title">
                <h2>${fDateInfo.feriaName}</h2>
                <h3>일시 ${fDateInfo.year}년
                </h3>
                <strong>
                	${fDateInfo.month}월
                	${fDateInfo.date}일
                </strong>
                <h3>
                	${fDateInfo.hour}시 
                	${fDateInfo.min}분
                </h3>
                <c:if test="${loginUser!=null}">
	        		<c:if test="${flag==1}">
	            		<button class="btn_review">리뷰 작성하기</button>
	            	</c:if>
            	</c:if>
            </div>
        <script src="/js/jquery.js"></script>
    	<script src="/js/starrr.js"></script>
            <div class="feria_info_header">
                <h3>페리아에 함께 즐긴 세나와 비베</h3>
            </div>
            
            <div class="feria_info_photo">
                <ul>
                <c:forEach items="${bibes}" var="bibe">
                    <li>
                        <img class="img_feria" src="img/${bibe.bibeImg}"><!--첫번째만 무조건 세나사진-->
                        <div class="min_profile">
                            <img src="img/${bibe.guestProfileImg}">
                            <span>${bibe.guestName}</span>
                            <c:if test="${loginMember!=null}">
	                            <c:if test="${flag==1}">
	                            	<input class="guest_no" type="hidden" value="${bibe.guestNo}"/>
	                            	
		                            	<button class="block_btn">
		                            		Block
		                            	</button>
	                            	
	                        	</c:if>
                        	</c:if>
                        </div>
                    </li>
                </c:forEach>    
                </ul>
                <script>
                	$(".block_btn").on("click",function(){
                		const userNo2=$(this).closest(".min_profile").find(".guest_no").val();
                		$(this).addClass("on");
                		$.ajax({
                			url:"/ajax/addBlackList.feria",
                			data:{userNo2:userNo2},
                			dataType:"json",
                			type:"POST",
                			error:function(){alert("오류");},
                			success:function(json){
                				alert(json.msg);
                				
                			}
                		})
                		
                	})
                </script>
            </div>
            
        </div>
        
<!--feria info끝-->

        <!--review photo-->
        <div class="feria_photo">
            <div class="feria_photo_header">
                <h3>페리아에 대한 추억 나누기</h3>
            </div>
            <c:forEach items="${fDateImg}" var="img">
            	<div class="review_photo">
                	<img src="img/uploadFeriaReviewImg/${img.fImg}">
            	</div>
            </c:forEach>
        </div>
		

        <div id="reviewEditWrap">
            <div class="review_window">
            	<form id="uploadReview" action="/uploadReviews.feria" method="POST"></form>
                <input type="hidden" form="uploadReview" name="fDateNo" value="${fDateInfo.fDateNo}">
                <div class="review_edit_header">
                    <h1>즐거웠던 페리아와</h1>
                    <h1>같이 마시며 즐긴 비베의 리뷰를 작성해 볼까요?</h1>
                </div>
                <!-- 0808 김우석 수정 -->
                <div class="review_edit_add_photo">
                    <h1>즐거웠던 페리아 사진 넣기</h1>
                    <h4>최대 5장</h4>
                    <div class="feria_review_img_box">
                    	<label class="label_Feria_Review_Img" for="0">
                    		<img class="fImg" src="/img/imageAddPlus.jpg">
                    	</label>
                    	<input id="0" class="feria_Review_Img" type="file" name="feriaReviewImg">
                    	<input form="uploadReview" class="fImgName" type="hidden" name="fImg"/>
                		<button class="del_btn">삭제</button>
                	</div>
                </div>
                <script>
                	/*0808 김우석 작성*/
                	const $feriaReviewImg=$("#0");
                	let idx=0;
                	$feriaReviewImg.hide();
                	$(".review_window").on("click",".feria_review_img_box .del_btn",function(e){
                		e.preventDefault();
                		const $feria_review_img_box=$(this).closest(".feria_review_img_box");
                		alert("delete");
                		console.log("delete");
                		if(idx==0){
                			const attr=$feria_review_img_box.find(".fImg").attr("src");
                			
                			if(attr!="/img/imageAddPlus.jpg"){
                				const attr=$feria_review_img_box.find(".fImg").attr("src","/img/imageAddPlus.jpg");
                			}else{
                				return false;
                			}
                		}else{
                			$feria_review_img_box.remove();idx--;
                		}
                	})
                	//이미지 ajax 업로드
                	$(document).on("change",".feria_Review_Img",function(e){
                		if(idx>=5){alert("최대 5개의 이미지만 올릴 수 있음"); return false;}
                		let files=e.target.files;
                		let file=files[0];
                		const $feria_review_img_box=$(this).closest(".feria_review_img_box");
                		alert(file.name);
                		if(file.type.match("image.*")){
                			alert(file.type);
                			let formData=new FormData();
                			formData.append("feriaReviewImg",file,file.name);
                			$.ajax({
                				url:"/ajax/uploadFeriaReviewImg.feria",
                				type:'POST',
                				contentType:false,
                				processData:false,
                				data:formData,
                				dataType:'json',
                				error:function(){alert("점검중...");},
                				success:function(json){
                					console.log(json);
                					let $newImgBox=$feria_review_img_box.clone()
                					$newImgBox.find(".feria_Review_Img").attr("id",++idx);
                					$feria_review_img_box.find(".fImg").attr("src",json.src);
                					$feria_review_img_box.find(".fImgName").val(json.fileName);
                					$newImgBox.find(".fImg").val("");
                					$newImgBox.find("fImgName").val("");
                					$feria_review_img_box.after($newImgBox);
                				}
                			});
                		}else{
                			alert("이미지만 첨부가능합니다");
                		}
                	})
                </script>
                <div class="review_edit_text">
                    <h1>페리아 리뷰</h1>
                    <textarea form="uploadReview" name="frText"></textarea>
                </div>
                <div class="review_edit_bibe_review">
                    <h1>함께 마신 비베 리뷰</h1>
                    <ul>
                    	<c:forEach items="${bibes}" var="bibe" varStatus="status">
                        <li>
                        	<div class="wrap_review_img">
                            <img class="review_img" src="img/${bibe.bibeImg}">
                            </div>
                            <h3>${bibe.bibeName}</h3>
                            <input form="uploadReview" type="hidden" name="bibeNo" value="${bibe.bibeNo}">
                            
                            <div class="wrap_toggle">
                                <p class="radio">
                                    <input id="brSwY${status.index}" form="uploadReview" class="input_sweet"
                                    checked value="Y" type="checkBox" name="brSw">
                                    <input id="brSwN${status.index}" form="uploadReview" class="input_sweet" 
                                    value="N" type="checkBox" name="brSw">
                                    <span class="sweet_radio">
                                    	<label for="brSwY${status.index}" class="brSwY first_value">달달함</label>
                                   		<label for="brSwN${status.index}" class="brSwN second_value">드라이</label>
                                	</span>
                                </p>
								
                               <p class="radio">
                                    <input id="brTs" form="uploadReview" class="input_co2"
                                    checked type="checkBox" value="Y" name="brTs">
                                    <input id="brMts" form="uploadReview" class="input_co2" 
                                     type="checkBox" value="N" name="brTs">
                                    <span class="input_co2">
                                    	<label for="brTs" class="brTs first_value">탄산</label>
                                    	<label for="brMts" class="brMts second_value">무탄산</label>
                                	</span>
                                </p>

                                <p class="radio">
                                    <input id="heavy" form="uploadReview" class="input_body" 
                                    checked type="checkBox" name="brBd" value="Y">
                                    <input id="light" form="uploadReview" class="input_body" 
                                    type="checkBox" name="brBd" value="N">
                                    <span class="bodys">
                                        <label for="heavy" class="heavy first_value">무거움</label>
                                        <label for="light" class="light second_value">가벼움</label>
                                    </span>
                                </p>
                            </div>
                            <div class="star_point_container">
                                <input form="uploadReview" class="br_star" type="number" name="brStar" 
                                value="0">
                                <div class="star">
                                	<i class="far fa-star"></i>
                                	<i class="far fa-star"></i>
                                	<i class="far fa-star"></i>
                                	<i class="far fa-star"></i>
                                	<i class="far fa-star"></i>
                                </div>
                        	</div>
                        </li>
                        </c:forEach>
                    </ul>
					 <script>
                        	/* $('input[type="checkBox"][name="brSw"]').on("clicked",function(){
                        		if($(this).prop('check')){
                        			$('input[type="checkBox"][name="brSw"]').prop('check',false);
                        			$(this).prop('check',true);
                        		}
                        	}) */
                           
                            $(".star>i").on("click",function(){
                            	let index=$(this).index();
                            	alert(index+1);
                            	const $brStar=$(this).closest(".star_point_container").find(".br_star");
                            	//alert("index : "+index);
                            	$(this).closest(".star_point_container").find(".star").find("i").css({"color":"rgb(33, 150, 243)"});
                            	for(let i=0;i<=index;i++){
                            		$(this).closest(".star_point_container").find(".star").find("i")
                            		.eq(i).css({"color":"rgb(232, 82, 1)"});
                            	}
                            		
                            	$(this).closest(".star_point_container").find(".br_star").val(index+1);
                            	console.log($(this).closest(".star_point_container").find(".br_star"));
                            	let value=$(this).closest(".star_point_container").find(".br_star").val();
                            	console.log(value);
                            })
                            </script>
                </div>
                <div class="review_edit_buttons">
                    <button type="reset" class="cancel">취소</button>
                    <button form="uploadReview" type="submit" class="submit">등록</button>
                </div>
				<script>
				
				</script>
            </div>
        </div><!--//#reviewEditWrap-->


        <div id="photoViewWrap">
            <div class="photo_view_window">
                <div class="container">

                    <div class="flickSlider">

                        <div class="flickView">
                            <ul>
                            	<c:forEach items="${fDateImg}" var="img">
                            		<li><a href="#1"><img src="img/uploadFeriaReviewImg/${img.fImg}" alt=""></a></li>
                				</c:forEach>
                                
                            </ul>
                        </div><!--/.flickView-->
						
                        <div class="flickThumb">
                            <ul>
                            	<c:forEach items="${fDateImg}" var="img">
                            		<li><img src="img/uploadFeriaReviewImg/${img.fImg}" alt=""></li>
                				</c:forEach>
                            </ul>
                        </div><!--/.flickThumb-->

                    </div><!--/.flickSlider-->
<!--<h2>COPYRIGHT &copy; <a href="http://black-flag.net/">BLACKFLAG.NET</a> ALL RIGHTS RESERVED.</h2>저작권은 이분꼐 -->
                </div><!--/#container-->
            </div>
        </div>
    </div>


    <script>

        // $(document).ready(function(){
        //     $("#photoViewWrap").fadeOut(100);
        // });



        $(".btn_review").click(function () {
            $("#reviewEditWrap").fadeIn(200);
            /*바디 스크롤 막기*/
            $('html').css({'overflow': 'hidden', 'height': '100%'});
            //$('html, body').css({'overflow': 'hidden', 'height': '100%'});
            $('#element').on('scroll touchmove mousewheel', function(event) {
                event.preventDefault();
                event.stopPropagation();
                return false;
            });
        });

        $(".review_window").click(function (e) {
            //부모로 이벤트 전파를 막음
            e.stopPropagation();
        })

        $(".cancel,#reviewEditWrap").click(function () {
            $("#reviewEditWrap").fadeOut(200);

            /*바디 스크롤 막기 해제코드*/
            $('html').css({'overflow': 'auto', 'height': '100%'});
            $('#element').off('scroll touchmove mousewheel');
        });


        $(".review_photo img").click(function () {
            $("#photoViewWrap").fadeIn(200);
            /*바디 스크롤 막기*/
            $('html').css({'overflow': 'hidden', 'height': '100%'});
            //$('html, body').css({'overflow': 'hidden', 'height': '100%'});
            $('#element').on('scroll touchmove mousewheel', function(event) {
                event.preventDefault();
                event.stopPropagation();
                return false;
            });




            /*슬라이더 스크립트*/
            var setWrap = $('.flickSlider'),
                setMainView = $('.flickView'),
                setThumbNail = $('.flickThumb'),
                setMaxWidth = 800,
                setMinWidth = 320,
                thumbNum = 5,
                thumbOpc = 0.5,
                scrollSpeed  = 500,
                delayTime = 5000,
                easing = 'linear',
                sideNavi = 'on', // 'on' or 'off'
                autoPlay = 'off'; // 'on' or 'off'

            var agent = navigator.userAgent;
            setWrap.each(function(){
                var thisObj = $(this),
                    childMain = thisObj.find(setMainView),mainUl = childMain.find('ul'),mainLi = mainUl.find('li'),mainLiLink = mainLi.children('a'),mainLiImg = mainLi.find('img'),
                    childThumb = thisObj.find(setThumbNail),thumbUl = childThumb.find('ul'),thumbLi = childThumb.find('li'),thumbLiFst = childThumb.find('li:first'),thumbLiLst = childThumb.find('li:last'),
                    mainWidth = parseInt(childMain.css('width')),mainHeight = parseInt(childMain.css('height')),listCount = mainUl.children('li').length;

                thisObj.css({display:'block'});

                // レスポンシブ動作メイン
                imgSize();
                function imgSize(){
                    var windowWidth = parseInt($(window).width()),
                        setUlLeft = parseInt(mainUl.css('left')),
                        setlistWidth = parseInt(mainLi.css('width')),
                        setLeft = setUlLeft / setlistWidth;

                    if(windowWidth >= setMaxWidth) {
                        thisObj.css({width:setMaxWidth});
                        childMain.css({width:setMaxWidth});
                        mainUl.css({width:((setMaxWidth)*(listCount))});
                        mainLi.css({width:setMaxWidth});

                        var listWidthA = parseInt(mainLi.css('width')),
                            leftMax = -((listWidthA)*((listCount)-1)),
                            baseHeight = mainLiImg.height();
                        childMain.css({height:baseHeight});
                        mainUl.css({height:baseHeight});
                        mainLi.css({height:baseHeight});

                        thumbUl.css({width:setMaxWidth});
                        thumbLi.css({width:((setMaxWidth)/(thumbNum)),height:''});
                    } else if(windowWidth < setMaxWidth) {
                        var listWidthB = parseInt(childMain.css('width')),
                            leftMax = -((listWidthB)*((listCount)-1));
                        thisObj.css({width:setMaxWidth});
                        if(windowWidth >= setMinWidth) {
                            thisObj.css({width:'100%'});
                            childMain.css({width:'100%'});
                            mainUl.css({width:((listWidthB)*(listCount))});
                            mainLi.css({width:(listWidthB)});
                        } else if(windowWidth < setMinWidth) {
                            thisObj.css({width:setMinWidth});
                            childMain.css({width:setMinWidth});
                            mainUl.css({width:((setMinWidth)*(listCount))});
                            mainLi.css({width:setMinWidth});
                        }
                        var reHeight = mainLiImg.height();
                        childMain.css({height:reHeight});
                        mainUl.css({height:reHeight});
                        mainLi.css({height:reHeight});

                        var reWidth = setThumbNail.width();
                        thumbUl.css({width:reWidth});
                        thumbLi.css({width:((reWidth)/(thumbNum))});
                    }

                    var adjLeftWidth = parseInt(mainLi.css('width')),
                        adjLeft = adjLeftWidth * setLeft;
                    mainUl.css({left:(adjLeft)});
                }
                imgSize();
                $(window).resize(function(){
                    if(!(agent.search(/iPhone/) != -1 || agent.search(/iPad/) != -1 || agent.search(/iPod/) != -1 || agent.search(/Android/) != -1)){
                        if(autoPlay == 'on'){clearInterval(setTimer);}
                        imgSize();
                        if(autoPlay == 'on'){slideTimer();}
                    } else {
                        imgSize();
                    }
                });

                // フリックアクション
                var isTouch = ('ontouchstart' in window);
                mainUl.on(
                    {'touchstart mousedown': function(e){
                            if(mainUl.is(':animated')){
                                e.preventDefault();
                            } else {
                                if(autoPlay == 'on'){clearInterval(setTimer);}
                                if(!(agent.search(/iPhone/) != -1 || agent.search(/iPad/) != -1 || agent.search(/iPod/) != -1 || agent.search(/Android/) != -1)){
                                    e.preventDefault();
                                }
                                this.pageX = (isTouch ? event.changedTouches[0].pageX : e.pageX);
                                this.leftBegin = parseInt($(this).css('left'));
                                this.left = parseInt($(this).css('left'));
                                this.touched = true;
                            }
                        },'touchmove mousemove': function(e){
                            if(!this.touched){return;}
                            e.preventDefault();
                            this.left = this.left - (this.pageX - (isTouch ? event.changedTouches[0].pageX : e.pageX) );
                            this.pageX = (isTouch ? event.changedTouches[0].pageX : e.pageX);
                            $(this).css({left:this.left});
                        },'touchend mouseup mouseout': function(e){
                            if (!this.touched) {return;}
                            this.touched = false;

                            var setThumbLiActive = thumbUl.children('li.active'),
                                listWidth = parseInt(mainLi.css('width')),leftMax = -((listWidth)*((listCount)-1));

                            if(((this.leftBegin)-30) > this.left && (!((this.leftBegin) === (leftMax)))){
                                $(this).stop().animate({left:((this.leftBegin)-(listWidth))},scrollSpeed,easing);
                                setThumbLiActive.each(function(){
                                    $(this).removeClass('active');
                                    $(this).next().addClass('active');
                                });
                            } else if(((this.leftBegin)+30) < this.left && (!((this.leftBegin) === 0))){
                                $(this).stop().animate({left:((this.leftBegin)+(listWidth))},scrollSpeed,easing);
                                setThumbLiActive.each(function(){
                                    $(this).removeClass('active');
                                    $(this).prev().addClass('active');
                                });
                            } else if(this.leftBegin === 0) {
                                $(this).stop().animate({left:'0'},scrollSpeed,easing);
                            } else if(this.leftBegin <= leftMax) {
                                $(this).stop().animate({left:(leftMax)},scrollSpeed,easing);
                            } else if(this.left >= 0) {
                                $(this).stop().animate({left:'0'},scrollSpeed);
                            } else if(this.left <= leftMax) {
                                $(this).stop().animate({left:(leftMax)},scrollSpeed,easing);
                            } else {
                                $(this).stop().animate({left:(this.leftBegin)},scrollSpeed,easing);
                            }
                            compBeginLeft = this.leftBegin;
                            compThisLeft = this.left;
                            mainLiLink.click(function(e){
                                if(!(compBeginLeft === compThisLeft)){
                                    e.preventDefault();
                                }
                            });
                            if(autoPlay == 'on'){slideTimer();}
                        }
                    });

                // ボタン移動動作
                thumbLi.click(function(){
                    if(autoPlay == 'on'){clearInterval(setTimer);}
                    var listWidth = parseInt(mainLi.css('width')),leftMax = -((listWidth)*((listCount)-1)),
                        connectCont = thumbLi.index(this);
                    mainUl.stop().animate({left:(-(listWidth)*(connectCont))},scrollSpeed,easing);
                    thumbLi.removeClass('active');
                    $(this).addClass('active');
                    if(autoPlay == 'on'){slideTimer();}
                });
                thumbLiFst.addClass('active');
                thumbLi.css({opacity:thumbOpc});

                // サイドナビボタン（有り無し）
                if(sideNavi == 'on'){
                    childMain.append('<div class="btnPrev"></div><div class="btnNext"></div>');
                    var setPrev = childMain.find('.btnPrev'),setNext = childMain.find('.btnNext'),setPrevNext = childMain.find('.btnPrev,.btnNext');
                    setPrevNext.css({opacity:0});

                    setNext.click(function(){
                        var setThumbLiActive = thumbUl.children('li.active');
                        setThumbLiActive.each(function(){
                            var listLengh = thumbLi.length;
                            var listIndex = thumbLi.index(this);
                            var listCount = listIndex+1;
                            if(listLengh == listCount){
                                thumbLiFst.click();
                            } else {
                                $(this).next('li').click();
                            }
                        });
                    });
                    setPrev.click(function(){
                        var setThumbLiActive = thumbUl.children('li.active');
                        setThumbLiActive.each(function(){
                            var listLengh = thumbLi.length;
                            var listIndex = thumbLi.index(this);
                            var listCount = listIndex+1;
                            if(1 == listCount){
                                thumbLiLst.click();
                            } else {
                                $(this).prev('li').click();
                            }
                        });
                    });
                }

                // サムネイルマウスオーバー
                if(!(agent.search(/iPhone/) != -1 || agent.search(/iPad/) != -1 || agent.search(/iPod/) != -1 || agent.search(/Android/) != -1)){
                    thumbLi.hover(function(){
                        $(this).stop().animate({opacity:'1'},300);
                    },function(){
                        $(this).stop().animate({opacity:thumbOpc},300);
                    });
                    if(sideNavi == 'on'){
                        setPrevNext.hover(function(){
                            $(this).stop().animate({opacity:'1'},300);
                        },function(){
                            $(this).stop().animate({opacity:0},300);
                        });
                    }
                }

                // 自動再生（有り無し）
                if(autoPlay == 'on'){
                    function slideTimer() {
                        setTimer = setInterval(function(){
                            var setThumbLiActive = thumbUl.children('li.active');
                            setThumbLiActive.each(function(){
                                var listLengh = thumbLi.length;
                                var listIndex = thumbLi.index(this);
                                var listCount = listIndex+1;
                                if(listLengh == listCount){
                                    thumbLiFst.click();
                                } else {
                                    $(this).next('li').click();
                                }
                            });
                        },delayTime);
                    }
                    slideTimer();
                }
            });
/*슬라이더 스크립트 끝*/

            //alert($(".small_photo img").length);요소 개수 확인
        });

        $(".photo_view_window").click(function (e) {
            //부모로 이벤트 전파를 막음
            e.stopPropagation();
        })

        $(".cancel,#photoViewWrap").click(function () {
            $("#photoViewWrap").fadeOut(200);

            /*바디 스크롤 막기 해제코드*/
            $('html').css({'overflow': 'auto', 'height': '100%'});
            $('#element').off('scroll touchmove mousewheel');
        });



        $('#star1').starrr({
            change: function(e, value){
                if (value) {
                    $('.your-choice-was').show();
                    $('.choice').text(value);
                } else {
                    $('.your-choice-was').hide();
                }
            }
        });
        $('#star2').starrr({
            change: function(e, value){
                if (value) {
                    $('.your-choice-was').show();
                    $('.choice').text(value);
                } else {
                    $('.your-choice-was').hide();
                }
            }
        });
        $('#star3').starrr({
            change: function(e, value){
                if (value) {
                    $('.your-choice-was').show();
                    $('.choice').text(value);
                } else {
                    $('.your-choice-was').hide();
                }
            }
        });
        $('#star4').starrr({
            change: function(e, value){
                if (value) {
                    $('.your-choice-was').show();
                    $('.choice').text(value);
                } else {
                    $('.your-choice-was').hide();
                }
            }
        });
        $('#star5').starrr({
            change: function(e, value){
                if (value) {
                    $('.your-choice-was').show();
                    $('.choice').text(value);
                } else {
                    $('.your-choice-was').hide();
                }
            }
        });

    </script>
    <!--별점끝-->


</body>
</html>