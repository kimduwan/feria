<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/notosanskr.css">
    <c:import url="/WEB-INF/template/link.jsp"></c:import>
	
    <style>
        #wrapReservation{
            margin: auto;
            width: 1200px;
            height: auto;
        }

        #wrapReservation #wrapReservation h3{
            font-size: 16px;
            margin-top: 5px;
            margin-bottom: 5px;

        }

        .reservation_title{
            margin: auto;
        }

        .reservation_title h2{
            margin-bottom: 10px;
            font-size: 24px;
        }
        .reservation_title h3{
            display: inline;
        }
        .reservation_title strong{
            display: inline;
            background-color: rgb(33, 150, 243);
            color: white;
            border-radius: 5px;
            padding: 2px 0 ;
        }
        .reservation_map {
            margin-top: 10px;
        }
        .reservation_map h3{
            font-size: 16px;
            float: left;
        }
        .reservation_map .text_local{
            position: relative;
            margin-top: -3px;
            margin-bottom: 10px;
            width: 300px;
        }
        .reservation_map #map{
            width: 1200px;
            height: 300px;
            margin-bottom: 20px;
        }
        .wrap_bibe_list{
        }
        .wrap_bibe_list h3{
            width: 218px;
            border-bottom: 2px solid black;
            padding-bottom: 10px;
        }

        .wrap_bibe_list .bibe_list{
            position: relative;
            width: 1110px;
            height: 900px;
            left: 50%;
            margin-left: -555px;
            margin-top: 10px;

        }
        .wrap_bibe_list .bibe_list ul{
            position: relative;
            margin: auto;
        }
        .wrap_bibe_list .bibe_list .bibe{
            position: relative;
            float: left;
            width: 350px; height: 455px;
            margin: 10px 10px 15px 10px;
        }
        .wrap_bibe_list .bibe_list .bibe div{
            position:absolute;

        }
        .wrap_bibe_list .bibe_list .bibe .bibe_categories{
            background-color: rgb(232, 82, 1);
            color: white;
            border-radius: 5px;
            padding: 6px 6px ;
            top: 10px;
            left: 10px;
        }
        .wrap_bibe_list .bibe_list .bibe .icon{
            position: absolute;

            top: 15px;
            right: 10px;
        }
        .wrap_bibe_list .bibe_list .bibe .bibe_name{
            position: absolute;
            left: 10px;
            bottom: 65px;
        }
        .wrap_bibe_list .bibe_list .bibe .bibe_size{
            position: absolute;
            right: 10px;
            bottom: 65px;
        }
        .wrap_bibe_list .bibe_list li img{
            width: 350px;
            height: 400px;
            position:relative;
            border: 1px solid black;
        }
        .wrap_bibe_list .bibe_list .profile_box .profile_img{
            width:50px;
            height:50px;
            border: none;
        }
        .wrap_bibe_list .bibe_list .profile_box .pie_img{
            position: absolute;
            width:40px;
            height:40px;
            border: none;
            left: 60px;
            top: 5px;
        }
        .wrap_bibe_list .bibe_list .profile_box .user_name{
            position: absolute;
            top:16px;
            left: 106px;
        }
        .wrap_bibe_list .bibe_list .profile_box .user_phone{
            position: absolute;
            top:16px;
            right: 10px;
        }
        .wrap_bibe_list .bibe_list .profile_box{
            width:350px;
            height:50px;
            border: 1px solid #dddddd;
            margin-top: 5px;
        }



    </style>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp"></c:import>
    <div id="wrapReservation">
        <div class="reservation_title">
            <h2>${fDateInfo.feriaName}</h2>
            <h3>일시 ${fDateInfo.year}년 ${fDateInfo.month+1}월 ${fDateInfo.date}일</h3>
            
            <h3>${fDateInfo.hour}시 ${fDateInfo.min}분</h3>
            <strong>한식</strong>
        </div><!--//.reservation_title-->
        <div class="reservation_map">
            <h3>위치</h3>
            <input class="text_local" type="text" placeholder="${fDateInfo.feriaAddress}" disabled>
            <div id="map"></div>
        </div>
        <div class="wrap_bibe_list">

            <h3>게스트가 준비한 달콤한 비베</h3>
            <div class="bibe_list">
                <ul>
                	<c:forEach items="${bibes}" var="bibe">
	                    <li class="bibe">
	                        <img src="img/${bibe.bibeImg}">
	                        <div class="bibe_categories">${bibe.bTypeName}</div>
	                        <div class="icon"><i class="fas fa-scroll"></i></div>
	                        <div class="bibe_name">${bibe.bibeName}</div><!--나중에 글자수 제한-->
	                        <div class="bibe_size">${bibe.bibeCnt}병 ${bibe.bibeMl}ml</div>
	                        <div class="profile_box">
	                            <img class="profile_img" src="img/${bibe.guestProfileImg}"/>
	                            <img class="pie_img" src="img/pie1.jpg" />
	                            <span class="user_name">${bibe.guestName}</span>
	                            <!-- <span class="user_phone">010-1234-5678</span> -->
	                        </div>
	                    </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>

<!--맵 이용을 위한 스크립트-->

    <script type="text/template" id="liTmp">
        <li data-lat='<@=place.y@>'
            data-lng="<@=place.x@>" class="item">
            <span class="markerbg marker_<@=idx+1@>"></span>
            <h5><@=place.place_name@></h5>
        </li>
    </script>
    <script src="js/jquery.js"></script>
    <script src="js/underscore-min.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d7752a1a79671239288745aa10b42bce&libraries=services"></script>
    <script>
        let flagcount = 0;
        //검색후 마커들을 모아놓는 배열
        const markers = [];

        // //검색버튼
        // const $search = $("#search");

        //페이지네이션 요소
        const $pagination = $("#pagination");

        //장소list item 템플릿
        const tmp = _.template($("#liTmp").html());

        let level = 3;

        const $placeList = $("#placesList");

        var infowindow = new kakao.maps.InfoWindow({zIndex: 1});

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
        const map = new daum.maps.Map(container, options);

        //주소-좌표간 변환 서비스 객체를 생성
        // const geocoder = new daum.maps.services.Geocoder();
        //장소 객체
        const placeService = new kakao.maps.services.Places();

        //장소를 클릭하면
        $placeList.on("click", "li", function () {

            //li요소의 data-lat과 data-lng 얻어오기(위도, 경도)
            const lat = $(this).attr("data-lat");
            const lng = $(this).attr("data-lng");

            //카카오맵 API에 있는 LatLng객체로 생성
            const latlng = new daum.maps.LatLng(lat, lng);

            //마커 생성
            const marker = new daum.maps.Marker();

            //마커를 맵에 세팅
            marker.setPosition(latlng);
            //맵의 확대축소 레벨을 2로(커질수록 더 넓은 범위를 보여줌)
            map.setLevel(3);
            //맵의 센터를 지정
            map.setCenter(latlng);

        });//click() end

        //검색하면 searchAddress 함수 호출

        $(document).ready(searchPlace);

        //검색하면 searchAddress 함수 호출
        // $search.keyup(function (e) {
        //     if (e.keyCode == 13) {
        //         searchPlace();
        //     }//if end
        // });//keyup() end

        //검색하는 함수
        function searchPlace() {

            console.log("다시 검색!");
            //flagcount = 0;
            const q = "수원시 권선구 권중로 99 벽산한성아파트";
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

        // 지도에 마커를 표시하는 함수입니다

        function displayMarker(place, idx) {

            if(flagcount == 0){
                flagcount++;
            }else {
                return false;
            }
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

        navigator.geolocation.getCurrentPosition(function (e) {

            // 현재위치를 얻어와서
            const latlng = new daum.maps.LatLng(e.coords.latitude, e.coords.longitude);
            //맵의 가운데로 지정
            map.setCenter(latlng);

        }, function () {
            // 유저가 현재위치를 원하지 않음
            console.log("유저가 원하지 않음!!");
        });//getCurrentPosition() end


    </script>

    <!--맵 이용을 위한 스크립트-->
    <c:import url="/WEB-INF/template/footer.jsp"></c:import>
</body>
</html>