<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>페리아 참가하기</title>
    <link rel="icon" href="img/logo.jpg">
    <link rel="stylesheet" href="/css/all.min.css">
    <link rel="stylesheet" href="/css/notosanskr.css">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/tui-date-picker.css">
    <link rel="stylesheet" href="/css/tui-time-picker.css">
    <link rel="stylesheet" href="/css/feria_join_1step.css">
    <link rel="stylesheet" href="/css/feria_join_2step.css">
    <link rel="stylesheet" href="/css/feria_join_step3.css">
    <link rel="stylesheet" href="/css/feria_join_4step.css">
    <style>
        /*폰트*/
        body{font-family: 'Noto Sans KR', sans-serif;}

        /*header 영역*/
        #wrapHeader{
            width: 1200px;
            height: 122px;
            margin: auto;
            border-bottom: solid 1px #aaaaaa;
        }
        #wrapHeader::after{
            content: "";
            clear: both;
        }
        #wrapHeader h1{
            float: left;
            padding: 10px 0 0 10px;
        }
        #wrapHeader h1 a{
            display: block;
            width: 100px; height: 100px;
            background: url(img/logo.jpg) no-repeat left top;
            background-size: 100px;
            text-indent: -5000px;
        }
        #wrapMenu{
            float: right;
            margin: 46.5px 20px 0 0;
        }
        #wrapMenu ul {
            text-align: center;
        }
        #wrapMenu ul::before{
            content: "";
            clear: both;
        }
        #wrapMenu ul li{
            float: left;
            margin-left: 20px;

        }
        #wrapMenu ul li .btn_menu::after, #wrapMenu ul li .btn_menu::before{
            content: "";
            width: 0;
            height:2px;

            position: absolute;
            bottom: 0;
            background-color: #222;

            transition: .2s ease;

        }
        #wrapMenu ul li .btn_menu::before{
            left: 50%;
        }
        #wrapMenu ul li .btn_menu::after{
            right: 50%;
        }
        #wrapMenu ul li .btn_menu:hover::before{
            transform: scaleX(1);
            width: 50%;
        }
        #wrapMenu ul li .btn_menu:hover::after{
            transform: scaleX(1);
            width: 50%;
        }
        #wrapHeader #wrapMenu ul li a{
            position:relative;
            text-decoration: none;
            color: #222222;
            display: block;
            height: 30px;
            line-height: 30px;
        }

        #wrapHeader #wrapMenu .btn_alarm{
            display: block;
            font-size: 22px;
        }
        #wrapHeader #wrapMenu .btn_account{
            display: block;
            text-align: center;
            line-height: 30px;
            width: 150px;
            height: 30px;
            border-radius: 20px;
            position: relative;
        }
        #wrapHeader #wrapMenu .btn_account img{
            display: inline-block;
            width:  25px;
            height: 25px;
            position: absolute;
            left: 2.5px;
            top: 2.5px;
        }
        #wrapHeader #wrapMenu .btn_account span{
            display: inline-block;
            position: absolute;
            left: 30px;
        }
        #wrapHeader #wrapMenu .account_depth::before{

        }
        #wrapHeader #wrapMenu .account_depth{
            margin-top: 5px;
            border: 1px solid #9e9e9e;
            background-color: #fff;
            border-radius: 5px;
        }
        #wrapHeader #wrapMenu .account_depth li{
            border-bottom: 1px solid #9e9e9e;
            float: none;
            width: 75%;
            height: 25px;
            margin: auto;
        }
        #wrapHeader #wrapMenu .account_depth li:nth-child(4){
            float: none;
            border-bottom: none;
            margin: auto;
        }
        #wrapHeader #wrapMenu .account_depth li a{
            display: block;
            width: 75%;
            height: 20px;
            line-height: 25px;
            font-size: 14px;
            margin: auto;
            text-align: center;
        }
        #wrapContent{
            width: 1200px;
            min-height: 1200px;
            margin: 100px auto 100px;
            overflow: auto;
        }
        #wrapContent legend{
            display: none;
        }

        #wrapProgress{
            width: 1200px;
            margin: auto;
        }
        #wrapProgress .wrap_bar ul{
            margin: auto;
            width: 880px;
            height: 30px;
        }
        #wrapProgress .wrap_bar li{
            float: left;
            width: 200px;
            height: 10px;
            background-color: #9e9e9e;
            margin: 10px;
            border-radius: 15px;
        }
        #wrapProgress .wrap_bar li:nth-child(1){
            background-color: #E65100;
        }
    /*컨테이너*/
        #container {
            width:1200px;
            height:800px;
        }

        #container.step1 #step1{
            display: block;
        }
        #container.step2 #step2 {
            display: block;
        }
        #container.step3 #step3 {
            display: block;
        }
        #container.step4 #step4 {
            display: block;
        }

        #step1,#step2,#step3 {
            width: 300px;
            height: 300px;
            position: absolute;
            display: none;
        }
        #step4{
            display: none;
        }
        
        .join_friends_input img{
        	display: inline-block;
        	vertical-align: center;
        	border-radius: 50%;
        }
        
        .join_friends_input span{
        	display: inline-block;
        	vertical-align: center;
        }
    </style>

</head>
<body>
<div id="wrapHeader">
    <h1>
        <a href="#">Feria</a>
    </h1>
    <div id="wrapMenu">
        <ul class="wrap_menu">
            <li><a href="#" class="btn_menu">페리아에 참가하기</a></li>
            <li><a href="#" class="btn_menu">페리아에 손님 맞이하기</a></li>
            <li><a href="#" class="btn_menu">페리아</a></li>
            <li><a href="#" class="btn_menu">비베</a></li>
            <li><a href="#" class="btn_alarm"><i class="fas fa-bell"></i></a></li>
            <li><a href="#" class="btn_account"><img src="/img/userImg/${loginUser.profileImg }" alt="프로필"><span>${loginUser.firstName }</span></a>
                <ul class="account_depth">
                    <li><a href="#">호스트</a></li>
                    <li><a href="#">게스트</a></li>
                    <li><a href="#">설정</a></li>
                    <li><a href="#">로그아웃</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<button class="button1">1</button>
<button class="button2">2</button>
<button class="button3">3</button>
<button class="button4">4</button>
<div id="wrapContent">
    <div id="container" class="step1">
        <div id="step1">
            <div id="wrapContentOne">
                <h2>페리아 참가하기</h2>
                <h3>페리아에 참가하여 사람들과 만나볼까요?</h3>
                <div id="wrapContentOne_formBox">
                    <form action="/gotoSelectLocation.feria" method="POST" id="wrapContentOne_form">
                        <fieldset>

                            <legend>페리아 참가 폼</legend>
                            <div class="wrap_half_left">
                                <div class="wrap_input_location" >
                                    <div class = "join join_location_input">
                                        <h4>여행 위치</h4>
                                        <input type="radio" name="location"  value="" class="trip" id="preTrip" checked>
                                        <label for="preTrip">여행 떠나기</label>
                                        <input type="radio" name="location"  value="" class="trip" id="afterTrip">
                                        <label for="afterTrip" id="currentLocation">현재 위치에서 먹기</label>
                                    </div>
                                    <p class="input_msg">*여행 위치를 선택해주세요.</p>
                                </div>
                                <div class="wrap_input_time">
                                    <div class = "join join_time_input">
                                        <h4>시간</h4>
                                        <input type="radio" name="time"  value="B" class="trip" id="breakfast">
                                        <label for="breakfast">아침</label>
                                        <input type="radio" name="time"  value="L" class="trip" id="lunch">
                                        <label for="lunch">점심</label>
                                        <input type="radio" name="time"  value="D" class="trip" id="dinner" checked>
                                        <label for="dinner">저녁</label>
                                    </div>
                                    <p class="input_msg">*시간을 선택해주세요.</p>
                                </div>
                                <div class="wrap_input_kinds">
                                    <div class = "join join_kinds_input">
                                        <h4>종류</h4>
                                        <input type="radio" name="kinds"  value="B" class="trip" id="rice" checked>
                                        <label for="rice">밥상</label>
                                        <input type="radio" name="kinds"  value="S" class="trip" id="drink">
                                        <label for="drink">술상</label>
                                    </div>
                                    <p class="input_msg">*종류를 선택해주세요.</p>
                                </div>
                                <div class="wrap_input_friends">
                                    <div class = "join join_friends_input">
                                        <h4>친구목록</h4>
                                        <c:forEach items="${friends }" var="friend" varStatus="idx">
                                        	<input type="checkbox" name="friends"  value="${friend.no }" class="trip friend" id="friends${idx.index }">
                                        	<label for="friends${idx.index }"><img src="/img/userImg/${friend.profileImg }" alt="" >${friend.name }</label>
                                        </c:forEach>
                                        <!-- <input type="checkbox" name="friends"  value="1" class="trip friend" id="friends1">
                                        <label for="friends1"><img src="img/user.png" alt="">박혜민</label>
                                        <input type="checkbox" name="friends"  value="2" class="trip friend" id="friends2">
                                        <label for="friends2"><img src="img/user.png" alt="">이제우</label>
                                        <input type="checkbox" name="friends"  value="3" class="trip friend" id="friends3">
                                        <label for="friends3"><img src="img/user.png" alt="">이원희</label>
                                        <input type="checkbox" name="friends"  value="4" class="trip friend" id="friends4">
                                        <label for="friends4"><img src="img/user.png" alt="">김두완</label>
                                        <input type="checkbox" name="friends"  value="5" class="trip friend" id="friends5">
                                        <label for="friends5"><img src="img/user.png" alt="">술상</label>
                                        <input type="checkbox" name="friends"  value="6" class="trip friend" id="friends6">
                                        <label for="friends6"><img src="img/user.png" alt="">술상</label> -->
                                    </div>
                                </div>
                                <div class="wrap_result_friends">함께할 친구를 선택해주세요.</div>
                            </div>
                            <div class="wrap_half_right">
                                <div class="wrap_input_date">
                                    <h4>날짜</h4>
                                    <div class="date">
                                        <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                                            <input type="text" id="datepicker-input" aria-label="Date-Time">
                                            <span class="tui-ico-date"></span>
                                        </div>
                                        <div id="wrapper"></div>
                                        <p class="date_msg">*날짜를 선택해주세요.</p>
                                    </div>
                                </div>
                                <div class="wrap_input_allergy">
                                    <h4>알레르기 유무</h4>
                                    <div class="allergy_img">
                                        <input type="checkbox" name="allergy"  value="1" class="allergy_check" id="allergy1">
                                        <label for="allergy1"></label>
                                        <input type="checkbox" name="allergy"  value="2" class="allergy_check" id="allergy2">
                                        <label for="allergy2"></label>
                                        <input type="checkbox" name="allergy"  value="3" class="allergy_check" id="allergy3">
                                        <label for="allergy3"></label>
                                        <input type="checkbox" name="allergy"  value="4" class="allergy_check" id="allergy4">
                                        <label for="allergy4"></label>
                                        <input type="checkbox" name="allergy"  value="5" class="allergy_check" id="allergy5">
                                        <label for="allergy5"></label>
                                        <input type="checkbox" name="allergy"  value="6" class="allergy_check" id="allergy6">
                                        <label for="allergy6"></label>
                                        <input type="checkbox" name="allergy"  value="7" class="allergy_check" id="allergy7">
                                        <label for="allergy7"></label>
                                        <input type="checkbox" name="allergy"  value="8" class="allergy_check" id="allergy8">
                                        <label for="allergy8"></label>
                                        <input type="checkbox" name="allergy"  value="9" class="allergy_check" id="allergy9">
                                        <label for="allergy9"></label>
                                        <input type="checkbox" name="allergy"  value="10" class="allergy_check" id="allergy10">
                                        <label for="allergy10"></label>
                                        <input type="checkbox" name="allergy"  value="11" class="allergy_check" id="allergy11">
                                        <label for="allergy11"></label>
                                        <input type="checkbox" name="allergy"  value="12" class="allergy_check" id="allergy12">
                                        <label for="allergy12"></label>
                                    </div>
                                </div>
                            </div>
                            <button type="button" class="btn_complete">다음</button>
                        </fieldset>
                    </form>
                </div>
            </div>

            <div id="wrapPop">
                <div class="wrap_pop_map">
                    <div class="wrap_locationBox">
                        <div id="locationBox">
                            <input id="search" placeholder="주소입력"/>
                            <button id="searchBtn">검색</button>
                            <ul id="placesList">
                            </ul>
                            <div id="pagination"></div>
                        </div>
                    </div>
                    <div id="map"></div>
                    <button class="btn_locate_close"><i class="fas fa-times"></i></button>
                    <button class="btn_locate_confirm">확인</button>
                </div>
            </div>

            <script type="text/template" id="liTmp">
                <li data-lat='<@=place.y@>' data-address="<@=place.address_name@>"
                    data-lng="<@=place.x@>" class="item">
                    <span class="markerbg marker_<@=idx+1@>"></span>
                    <h5><@=place.place_name@></h5>
                </li>
            </script>

            <script src="js/jquery.js"></script>
            <script src="js/tui-time-picker.js"></script>
            <script src="js/tui-date-picker.js"></script>
            <script src="js/moment-with-locales.js"></script>
            <script src="js/underscore-min.js"></script>
            <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d7752a1a79671239288745aa10b42bce&libraries=services"></script>
            <script>
			
            _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
            
                //var geocoder = new kakao.maps.services.Geocoder();
                var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
                    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
                const $btnConfirm = $(".btn_locate_confirm");
                const $friend = $(".friend");
                const $afterTripInput = $("#afterTrip");
                const $btnClose = $(".btn_locate_close");
                const $wrapPop = $("#wrapPop");
                let map = null;
                const $btnComplete = $(".btn_complete");
                let addressLatLng = null;
                const $currentLocation = $("#currentLocation");
                
                /* 전역변수 선언 */
                let locLatlng;	//위도+경도
                let locLat;		//위도
                let locLng;		//경도

                let addressName = "";

                //datepicker 출력
                const datepicker = new tui.DatePicker('#wrapper', {
                    date: new Date(),
                    input: {
                        element: '#datepicker-input',
                        format: 'yyyy-MM-dd'
                    },
                    language:'ko',
                    timePicker:true
                });

                /*다음 click evenvt*/
                $btnComplete.click(function () {

                    //여기서 afterinput check 확인하고 어디로 갈지 정해주면 될듯.
                    $.ajax({
                        url:"ajax/locationList.json",
                        error:function () {
                            alert("에러!");
                        },
                        success:function (json) {

                            $listLocation.html(locationTmp({regions:json}));

                            $("#container").attr("class","step2");
                        }
                    });//$.ajax() end
                })//$btnComplete click end
                /*다음 click evenvt END*/

                /*pop confirm event*/
                $btnConfirm.click(function () {
                    $wrapPop.css("display","none");
                    $("#container").attr("class","step1");
                    
                    /* 200809 장유정 */
                    /* 위도,경도 확인 */
                    console.log(locLatlng);
                    console.log("위도: " + locLat);
                    console.log("경도: " + locLng);
                    
                    $afterTripInput.val(locLat + "/" + locLng);
                    console.log("위도경도" + $afterTripInput.val());
                });

                /*pop close event*/
                $btnClose.click(function () {
                    $wrapPop.css("display","none");
                    $("#container").attr("class","step1");
                });
                /*pop close evnet END*/

                /*pop open event*/
                $afterTripInput.click(function () {
                    $wrapPop.css("display","block")

                    let level = 3;
                    //현재 위치를 유저가 설정하지 않았을때 나오는 기본 맵의 가운데 좌표(에그옐로우)
                    const latlng = new daum.maps.LatLng(37.48094907957599, 126.95208479057423);

                    //맵이 만들어질 요소 지정
                    const container = document.getElementById('map');
                    //맵이 만들어질때 옵션 지정
                    const options = {
                        center: latlng,
                        level: level
                    };

                    //맵 생성
                    map = new daum.maps.Map(container, options);

                    navigator.geolocation.getCurrentPosition(function (e) {

                        // 현재위치를 얻어와서
                        const latlng = new daum.maps.LatLng(e.coords.latitude, e.coords.longitude);
                        //맵의 가운데로 지정
                        map.setCenter(latlng);
                        
                        /* 200809 장유정 */
                        /* 위도경도 값 입력 */
                        locLat = map.getCenter().getLat();
                        locLng = map.getCenter().getLng();

                    }, function () {
                        // 유저가 현재위치를 원하지 않음
                        console.log("유저가 원하지 않음!!");
                    });//getCurrentPosition() end
                })
                /*pop open event END*/

                /*친구 확인 기능*/
                const $wrapReultBox = $(".wrap_result_friends");

                $friend.change(function () {
                    var chkNum = $("input:checkbox[name=friends]:checked").length;
                    console.log(chkNum);
                    if (chkNum==0){
                        $wrapReultBox.text("선택된 친구가 없습니다.");
                    }else{
                        $wrapReultBox.append().text("선택된 친구는 "+chkNum+"명 입니다.");
                    }

                });
                /*친구 확인 기능 END*/

                //검색후 마커들을 모아놓는 배열
                const markers = [];

                //검색버튼
                const $search = $("#search");

                //페이지네이션 요소
                const $pagination = $("#pagination");

                //장소list item 템플릿
                const tmp = _.template($("#liTmp").html());



                const $placeList = $("#placesList");


                //주소-좌표간 변환 서비스 객체를 생성
                const geocoder = new daum.maps.services.Geocoder();
                //장소 객체
                const placeService = new kakao.maps.services.Places();

                $placeList.on("click", "li", function () {

                    //li요소의 data-lat과 data-lng 얻어오기(위도, 경도)
                    const lat = $(this).attr("data-lat");
                    const lng = $(this).attr("data-lng");
                    addressName = this.dataset.address;


                    console.log(addressName);

                    $currentLocation.text("");
                    $currentLocation.text(addressName);

                    //카카오맵 API에 있는 LatLng객체로 생성
                    locLatlng = new daum.maps.LatLng(lat, lng);
                    console.log(locLatlng);
                    

                    //마커 생성
                    const marker = new daum.maps.Marker();

                    //마커를 맵에 세팅
                    marker.setPosition(locLatlng);
                    //맵의 확대축소 레벨을 2로(커질수록 더 넓은 범위를 보여줌)
                    map.setLevel(3);
                    //맵의 센터를 지정
                    map.setCenter(locLatlng);

                    $(this).siblings().css("border","none");

                    $(this).css("border","2px solid #E65100");

                    /*addressLatLng = latlng;
                    console.log(addressLatLng);*/


                });//click() end


                //검색하는 함수
                function searchPlace() {

                    console.log("다시 검색!");

                    const q = $search.val();

                    console.log("1");

                    //검색후 input 비우고 포커스 맞추기
                    // $search.val("").focus();

                    placeService.keywordSearch(q, function (result, status, pagination) {

                        // 정상적으로 검색이 완료됐으면
                        if (status === daum.maps.services.Status.OK) {

                            $placeList.empty();

                            displayPagination(pagination);

                            console.log(result);

                            //바운드 지정
                            var bounds = new daum.maps.LatLngBounds();

                            $(result).each(function (idx) {



                                var lat = this.y;
                                var lng = this.x;

                                var latlng = new daum.maps.LatLng(lat, lng);

                                bounds.extend(latlng);

                                displayMarker(this, idx);

                            });//each() end

                            map.setBounds(bounds);

                            level = map.getLevel();

                            $placeList.scrollTop(0);

                        }//if end

                    });//keywordSearch end


                    console.log("2");
                }//searchAddress() end

                // 지도에 마커를 표시하는 함수입니다
                function displayMarker(place, idx) {

                    console.log(place);

                    //https://place.map.kakao.com/main/v/41742921 이 json을 이용하면 플레이스 모든 정보 얻어올 수 있음

                    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
                        imgOptions = {
                            spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                            spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                        },
                        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                        marker = new kakao.maps.Marker({
                            position: new kakao.maps.LatLng(place.y, place.x), // 마커의 위치
                            image: markerImage
                        });

                    marker.setMap(map); // 지도 위에 마커를 표출합니다

                    markers.push(marker);

                    // 마커에 클릭이벤트를 등록합니다
                    kakao.maps.event.addListener(marker, 'mouseover', function () {
                        displayInfowindow(marker, place.place_name);
                    });

                    kakao.maps.event.addListener(marker, 'mouseout', function() {
                        infowindow.close();
                    });

                    const markup = $(tmp({place: place, idx:idx})).on("mouseenter",function () {
                        displayInfowindow(marker, place.place_name);
                    }).on("mouseleave",function () {
                        infowindow.close();
                    });

                    console.log(place);

                    $placeList.append(markup);

                }//displayMarker() end

                function displayInfowindow(marker,title) {
                    // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                    infowindow.setContent('<div style="padding:5px;font-size:12px;">' + title + '</div>');
                    infowindow.open(map, marker);
                    map.setLevel(level);
                }

                // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
                function displayPagination(pagination) {

                    //기존의 마커들 제거
                    $(markers).each(function () {
                        //console.log("기존의 마커 제거!");
                        this.setMap(null);
                    });//each() end

                    markers.splice(0);

                    $pagination.empty();

                    for (let i = 1; i <= pagination.last; i++) {
                        const $a = $("<a href='#'>").text(i);

                        if (i === pagination.current) {
                            $a.addClass("on");
                        } else {


                            $a.on("click", function () {
                                pagination.gotoPage(i);
                                // console.log("click했음");
                            });
                        }

                        $pagination.append($a);
                    }

                }//displayPagination() end

                //검색하면 searchAddress 함수 호출
                $("#searchBtn").click(searchPlace);

                //검색하면 searchAddress 함수 호출
                $search.keyup(function (e) {
                    if (e.keyCode == 13) {
                        searchPlace();
                    }//if end
                });//keyup() end

                //검색하는 함수
                function searchPlace() {

                    console.log("다시 검색!");

                    const q = $search.val();

                    //검색후 input 비우고 포커스 맞추기
                    // $search.val("").focus();

                    placeService.keywordSearch(q, function (result, status, pagination) {


                        // 정상적으로 검색이 완료됐으면
                        if (status === daum.maps.services.Status.OK) {

                            $placeList.empty();

                            displayPagination(pagination);


                            //바운드 지정
                            var bounds = new daum.maps.LatLngBounds();

                            $(result).each(function (idx) {

                                console.log(this);

                                var lat = this.y;
                                var lng = this.x;

                                var latlng = new daum.maps.LatLng(lat, lng);

                                bounds.extend(latlng);

                                displayMarker(this, idx);

                            });//each() end

                            map.setBounds(bounds);

                            level = map.getLevel();

                            $placeList.scrollTop(0);

                        }//if end

                    });//keywordSearch end

                }//searchAddress() end

                // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
                function displayPagination(pagination) {

                    //기존의 마커들 제거
                    $(markers).each(function () {
                        //console.log("기존의 마커 제거!");
                        this.setMap(null);
                    });//each() end

                    markers.splice(0);

                    $pagination.empty();

                    for (let i = 1; i <= pagination.last; i++) {
                        const $a = $("<a href='#'>").text(i);

                        if (i === pagination.current) {
                            $a.addClass("on");
                        } else {


                            $a.on("click", function () {
                                pagination.gotoPage(i);
                                // console.log("click했음");
                            });
                        }

                        $pagination.append($a);
                    }

                }//displayPagination() end

                // 지도에 마커를 표시하는 함수입니다
                function displayMarker(place, idx) {

                    //console.log(place);

                    //https://place.map.kakao.com/main/v/41742921 이 json을 이용하면 플레이스 모든 정보 얻어올 수 있음

                    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
                        imgOptions = {
                            spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                            spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                        },
                        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                        marker = new kakao.maps.Marker({
                            position: new kakao.maps.LatLng(place.y, place.x), // 마커의 위치
                            image: markerImage
                        });

                    marker.setMap(map); // 지도 위에 마커를 표출합니다

                    markers.push(marker);

                    // 마커에 클릭이벤트를 등록합니다
                    kakao.maps.event.addListener(marker, 'mouseover', function () {
                        displayInfowindow(marker, place.place_name);
                    });

                    kakao.maps.event.addListener(marker, 'mouseout', function() {
                        infowindow.close();
                    });

                    const markup = $(tmp({place: place, idx:idx})).on("mouseenter",function () {
                        displayInfowindow(marker, place.place_name);
                    }).on("mouseleave",function () {
                        infowindow.close();
                    });

                    $placeList.append(markup);

                }//displayMarker() end
                function displayInfowindow(marker,title) {
                    // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                    infowindow.setContent('<div style="padding:5px;font-size:12px;">' + title + '</div>');
                    infowindow.open(map, marker);
                    map.setLevel(level);
                }

            </script>
        </div>
        <div id="step2">
            <div id="wrapContentTwo">
                <h2>가고싶은 지역을 선택해 볼까요?</h2>
                <h3>페리아 참가하기</h3>
                <div id="wrapContentTwo_formBox">
                    <form action="">
                        <fieldset>
                            <legend class="screen_out">페리아 지역 선택 폼</legend>
                            <button type="button" class="btn_redo"><i class="fas fa-redo-alt"></i></button>
                            <div class="versus">VS</div>
                            <ul class="list_location">

                            </ul>
                        </fieldset>
                    </form>
                </div>
            </div>
            <script type="text/template" id="locationTmpl">
                <@_.each(regions,function(location) {@>
                <li class="img_location"><a href="#" class="location_click"><img src="/img/cityImg/<@=location.cityImg@>" alt=""></a></li>
                <@})@>
            </script>
            <script>
                //ul
                const $listLocation = $(".list_location");

                const locationTmp = _.template($("#locationTmpl").html());


                $listLocation.on("click",".img_location",function () {

                    $.ajax({
                        url:"ajax/cenaList.json",
                        error:function () {
                            alert("에러!");
                        },
                        success:function (json) {

                            console.log(json);

                            $listCena.html(cenaTmp({cenas:json})); //json이 뒤로

                            $("#container").attr("class","step3");
                        }
                    });//$.ajax() end

                });//imgLocation click end

            </script>
        </div>
        <div id="step3">
            <div id="wrapContentThree">
                <h2>먹고싶은 세나를 선택해 볼까요?</h2>
                <h3>페리아 참가하기</h3>
                <div id="wrapContentThree_formBox">
                    <form action="">
                        <fieldset>
                            <legend class="screen_out">페리아 세나 선택 폼</legend>
                            <button type="button" class="btn_redo"><i class="fas fa-redo-alt"></i></button>
                            <div class="versus">VS</div>
                            <ul class="list_cena">

                            </ul>
                        </fieldset>
                    </form>
                </div>
            </div>

            <script type="text/template" id="cenaTmpl">
                <@_.each(cenas,function(cena) {@>
                <li class="img_cena">
                    <input type="radio" name="cena" class="input_img_cena" id="cena<@=cena.no@>">
                    <label for="cena<@=cena.no@>">
                        <h4><@=cena.title@></h4><img src="/img/<@=cena.src@>" alt=""><!--<a href="#"></a>-->
                        <dl class="list_cena_serve">
                            <dt class="screen_out">반찬들</dt>
                            <@_.each(cena.serve,function(serve){@>
                            <dd><@=serve@></dd>
                            <@})@>
                        </dl>
                    </label>
                </li>
                <@})@>
            </script>
            <script>
                const $btnRedo = $(".btn_redo");
                //ul
                const $listCena = $(".list_cena");

                //const $listServe = $(".list_cena_serve");

                const cenaTmp = _.template($("#cenaTmpl").html());

                /*리롤 버튼을 눌렀을 때*/
                $btnRedo.on("click",function () {
                    confirm("되돌리기를 하시면 포인트가 사용됩니다." +
                        " 다시 매칭하여 이용하시겠습니까?")
                })

                $listCena.on("click",".img_cena",function () {

                    $("#container").attr("class","step4");

                })
            </script>
        </div>
        <div id="step4">
            <h2>호스트에게 보답 할 비베를 입력해 볼까요?</h2>
            <h3>페리아 참가하기</h3>
            <div id="wrap_bibe_formBox">
                <div class="wrap_cena_information" >
                    <div class="flag flag_b"></div>
                    <h4>상큼한 카레라이스</h4>
                    <div class="cena_img"><img class="cena_img" src="img/cena1.png" alt=""></div>
                    <div class="cena_serve"><ul><li>#새우튀김</li><li>#어묵우동</li><li>#샐러드</li></ul></div>
                </div>
                <div class="wrap_bibe_search"><!--wrap_search_bibe-->
                    <form action="">
                        <fieldset>
                            <div class="search_bar"><input type="text" id="input_search" name="query" placeholder="비베 이름을 입력해 주세요." autocomplete="off"><button class="btn_search" type="button">검색</button></div>
                            <div class="wrap_list_mybibe"><h5>나의 비베 리스트</h5><!--wrap_list_mybibe-->
                                <ul class="list_item_my_bibe"><!--list_result_mybibe-->

                                </ul>
                            </div>
                            <div class="wrap_result_search"><h5>검색 결과</h5><!--wrap_result_search-->
                                <ul class="list_item_search_bibe"> <!--list_result_search-->

                                </ul>
                                <button class="btn_input"><i class="fas fa-plus"></i> 직접 비베 추가</button>
                            </div>
                        </fieldset>
                    </form>
                </div>
                <div class="wrap_bibe_selected"><!--대문자 지우고-->

                </div>
                <button class="btn_complete">완료하기</button>

            </div>
            <div id="wrapProgress">
                <div class="wrap_bar">
                    <ul>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
            </div>
            <!--팝업-->
            <div id="wrapPopBibe">

            </div>
            <!--팝업 end-->
            <script type="text/template" id="itemSearchBibe">
                <@_.each(searchBibes,function(bibe) {@>
                <li class="item_bibe_detail" data-bibeno="<@=bibe.no@>"><!--item_result_search-->
                    <img src="img/montegri1.jpg" alt=""><span>참이슬 후레쉬</span>
                </li>
                <@})@>
            </script>
            <script type="text/template" id="itemMyBibe">
                <@_.each(myBibes,function(bibe) {@>
                <li class="item_bibe_detail"><img src="img/montegri1.jpg" alt=""><span>참이슬 후레쉬</span></li>
                <@})@>
            </script>
            <script type="text/template" id="bibeDetailInfo">
                <@_.each(bibeDetails,function(bibe) {@>
                <div class="wrap_pop_bibe">
                    <form action="">
                        <fieldset>
                            <div class="wrap_pop_bibe_information"><!--wrap_pop_bibe_info-->
                                <div class="wrap_bibe_img"><img class="bibe_img" src="img/bibe1.jpg" alt=""></div>
                                <p>상세정보</p>
                                <ul>
                                    <li id="bibeTitle">참이슬 후레쉬</li>
                                    <li id="bibeAVB">도수 16.9도</li>
                                    <li id="bibeManufacturer">제조 하이트진로</li>
                                    <li id="bibeVolume">용량 360ml</li>
                                    <li id="bibePrice">가격 1800원</li>
                                </ul>
                            </div>
                            <div class="wrap_pop_bibe_pie">
                                <div class="canvas">
                                    <canvas id="donut" width="100" height="50"></canvas>
                                </div>
                            </div>
                            <div class="wrap_bibe_grade">

                                <div class="wrap_grade">
                                    <strong class="info_left">드라이</strong>
                                    <div class="bar_toggle1 toggle" id="bibeSweet">
                                        <div class="bar_toggle2 toggle"></div>
                                    </div>
                                    <strong class="info_right">달콤함</strong>
                                </div>
                                <div class="wrap_grade">
                                    <strong class="info_left">탄산</strong>
                                    <div class="bar_toggle1 toggle" id="bibeCarbonate">
                                        <div class="bar_toggle2 toggle"></div>
                                    </div>
                                    <strong class="info_right">무탄산</strong>
                                </div>
                                <div class="wrap_grade">
                                    <strong class="info_left">가벼움</strong>
                                    <div class="bar_toggle1 toggle" id="bibeWeight">
                                        <div class="bar_toggle2 toggle"></div>
                                    </div>
                                    <strong class="info_right">무거움</strong>
                                </div>
                            </div>

                            <div class="wrap_input_quantity">
                                <h4>수량</h4>
                                <div>
                                    <label for="input_quantity" class="screen_out">최소</label>
                                    <input type="number" name="input_quantity" id="input_quantity" placeholder="수량 입력" min="1" class="input_quantity">
                                </div><!--#minHeadCount-->
                            </div><!--//.wrap_feria_headCount-->

                            <button class="btn_bibe_select">선택</button>
                            <button class="btn_bibe_close"><i class="fas fa-times"></i></button>
                        </fieldset>
                    </form>
                </div>
                <@})@>
            </script>
            <script src="js/jquery.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
            <script src="js/underscore-min.js"></script>
            <script>

                $btnBibeClose = $(".btn_bibe_close");
                $btnBibeSelect = $(".btn_bibe_select");
                $inputSeacrch = $("#input_search");
                //ul
                $wrapListMybibe = $(".list_item_my_bibe");
                //ul
                $wrapListResult = $(".list_item_search_bibe");
                $bibeItem = $(".item_bibe_detail");
                $resultBibeTmp = _.template($("#itemSearchBibe").html());
                $myBibeTmp = _.template($("#itemMyBibe").html());
                $bibeDetail = _.template($("#bibeDetailInfo").html());
                $wrapPopBibe = $("#wrapPopBibe");
                $wrapBibeFormBox = $("#wrap_bibe_formBox");
                let no = 0;


                $inputSeacrch.keyup(function () {
                    $.ajax({
                        type: "get",
                        url : "ajax/bibeList.json",
                        error:function () {
                            alert("점검중")
                        },//error end
                        success:function (json) {

                            $wrapListResult.html($resultBibeTmp({searchBibes:json}));

                        }//success end
                    })
                });


                $wrapPopBibe.on("click",$btnBibeClose,function () {
                    $("#wrapPopBibe").css("display","none");
                })

                $wrapListResult.on("click","li",function () {
                    $("#wrapPopBibe").css("display","block");

                    $.ajax({
                        type:"get",
                        url : "ajax/bibeInfo.json",

                        error : function () {
                            alert("점검중");
                        },//error end
                        success : function (json) {

                            $wrapPopBibe.html($bibeDetail({bibeDetails:json}));

                            setTimeout(function () {

                                /*도넛 차트*/
                                var $donut = $("#donut");
                                var donutData = {
                                    datasets: [{
                                        data: [59, 43 , 21],
                                        backgroundColor: ["rgb(255, 99, 132)", "rgb(54, 162, 235)","rgb(81,235,54)"],
                                        hoverBackgroundColor: ["rgba(255, 99, 132,0.7)", "rgba(54, 162, 235,0.7)","rgba(81,235,54,0.7)"],
                                        hoverBorderColor: ["rgba(255, 99, 132,1)", "rgba(54, 162, 235,1)","rgba(81,235,54,1)"],
                                        hoverBorderWidth: 6
                                    }],

                                    labels: [
                                        '한식',
                                        '일식',
                                        '중식'

                                    ]
                                };

                                var donutChart = new Chart($donut, {
                                    type: 'doughnut',
                                    data: donutData,
                                    options: {
                                        title: {
                                            display: true,
                                            text: "함께한 세나들",
                                            fontSize: 26
                                        },
                                        cutoutPercentage: 50, // 도넛 가운데 구멍 크기(50은 기본 0은 꽉 막힘)
                                        rotation: 0.5 * Math.PI, // 시작 각도 변경 (기본: -0.5 * Math.PI)
                                        animation: {animateScale: true, animateRotate: true}// 차트 나타날 때 애니메이션

                                    }
                                });
                                /*도넛차트 end*/
                            },100)

                        }//success
                    })
                })//wrapResult li click end

                function getMybibe() {

                    $.ajax({

                        url:"ajax/Mybibe.json",
                        type : "get",
                        dataType:"json",

                        error:function () {
                            alert("점검중");
                        },
                        success:function (json) {
                            $wrapListMybibe.html($myBibeTmp({myBibes:json}));
                        }

                    })

                }//getMybibe

                getMybibe();

                $wrapListMybibe.on("click","li",function () {
                    $("#wrapPopBibe").css("display","block");

                    $.ajax({
                        type:"get",
                        url : "ajax/bibeInfo.json",

                        error : function () {
                            alert("점검중");
                        },//error end
                        success : function (json) {

                            $wrapPopBibe.html($bibeDetail({bibeDetails:json}));

                            setTimeout(function () {

                                /*도넛 차트*/
                                var $donut = $("#donut");
                                var donutData = {
                                    datasets: [{
                                        data: [59, 43 , 21],
                                        backgroundColor: ["rgb(255, 99, 132)", "rgb(54, 162, 235)","rgb(81,235,54)"],
                                        hoverBackgroundColor: ["rgba(255, 99, 132,0.7)", "rgba(54, 162, 235,0.7)","rgba(81,235,54,0.7)"],
                                        hoverBorderColor: ["rgba(255, 99, 132,1)", "rgba(54, 162, 235,1)","rgba(81,235,54,1)"],
                                        hoverBorderWidth: 6
                                    }],

                                    labels: [
                                        '한식',
                                        '일식',
                                        '중식'

                                    ]
                                };

                                var donutChart = new Chart($donut, {
                                    type: 'doughnut',
                                    data: donutData,
                                    options: {
                                        title: {
                                            display: true,
                                            text: "함께한 세나들",
                                            fontSize: 26
                                        },
                                        cutoutPercentage: 50, // 도넛 가운데 구멍 크기(50은 기본 0은 꽉 막힘)
                                        rotation: 0.5 * Math.PI, // 시작 각도 변경 (기본: -0.5 * Math.PI)
                                        animation: {animateScale: true, animateRotate: true}// 차트 나타날 때 애니메이션

                                    }
                                });
                                /*도넛차트 end*/
                            },100)

                        }//success
                    })
                })//wrapMybibe li click end

                $wrapPopBibe.on("click",$btnBibeSelect,function () {

                    $(this).css("display","none");

                    $(".wrap_bibe_selected").append($bibeDetail);
                })//$btnBibeSelect click end


            </script>
    </div>
    <script src="js/jquery.js"></script>
    <script>

        /*$("button").click(function () {
            const idx = $(this).index()+1;
            $("#container").attr("class","step"+idx);
        })*/

        $btn1 = $(".button1"); $btn2 = $(".button2"); $btn3 = $(".button3"); $btn4 = $(".button4");
        $btn1.click(function () {
            $("#container").attr("class","step1");
        })
        $btn2.click(function () {
            $("#container").attr("class","step2");
        })
        $btn3.click(function () {
            $("#container").attr("class","step3");
        })
        $btn4.click(function () {
            $("#container").attr("class","step4");
        })

    </script>
</div>

<script src="js/jquery.js"></script>
<script src="js/tui-time-picker.js"></script>
<script src="js/tui-date-picker.js"></script>
<script src="js/moment-with-locales.js"></script>
<script>
	
	_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

    const $btnComplete = $(".btn_complete");

    const $input = $("<input>");
    const $inputMsg = $(".input_msg");
    const $dateMsg = $(".date_msg");

    const datepicker = new tui.DatePicker('#wrapper', {
        date: new Date(),
        input: {
            element: '#datepicker-input',
            format: 'yyyy-MM-dd'
        },
        language:'ko',
        timePicker:true
    });


    const $friend = $(".friend");
    const $wrapReultBox = $(".wrap_result_friends");

    $friend.change(function () {
        var chkNum = $("input:checkbox[name=friends]:checked").length;
        console.log(chkNum);
        if (chkNum==0){
            $wrapReultBox.text("선택된 친구가 없습니다.");
        }else{
            $wrapReultBox.append().text("선택된 친구는 "+chkNum+"명 입니다.");
        }

    });




</script>
</body>
</html>