<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:import url="/mypageHeader.feria"></c:import>
	<c:import url="/WEB-INF/template/guestHeader.jsp"></c:import>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게스트_참가한페리아</title>
    <link rel="stylesheet" href="css/mypage.css">
<c:import url="/WEB-INF/template/link.jsp"></c:import>
    <style>
        /*폰트*/
        body{font-family: 'Noto Sans KR', sans-serif;}

        .wrap_content{
            margin: auto;
            width: 1200px;
        }

        .attend_feria_header{
            text-align: center;
            width: 1000px;
            margin: auto;
        }
        .attend_feria_header h2{
            padding-top: 20px;
            font-size: 30px;
            margin-bottom: 10px;
        }
        .attend_feria_header h3{
            border-bottom: 1px solid #9e9e9e;
            padding-bottom: 10px;
            margin-bottom: 50px;
        }
        .wrap_attend_list{
            margin: auto;
            width: 1000px;
            position: relative;
            /*background-color: greenyellow;*/
        }
        /* map api style*/
        #map{
            background-color: peachpuff;
            width: 490px; height: 490px;
            display: block;
            left: 0; top: 0;
        }
        .map_wrap {position:relative;width:490px;height:490px;}
        .title {font-weight:bold;display:block;}
        .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
        #centerAddr {display:block;margin-top:2px;font-weight: normal;}
        .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
        .wrap_feria_attend{
            /*background-color: yellow;*/
            width: 488px; height: 490px;
            position: absolute;
            top: 0; right: 0;
        }
        /*//end*/
        .wrap_feria_attend::after{
            content: "";
            display: block;
            clear: both;
        }
        .list_attend_feria{
            float: left;
            margin-left: 20px;
            position: absolute;
            right: 0; top: 0;
        }
        .attend_feria{
            border: 1px solid #9e9e9e;
            width: 488px; height: 100px;
            float: left;
            position: relative;
            margin-bottom: 15px;
        }



        .attend_feria img{
            width: 100px; height: 100px;
            position: absolute;
            left: 0; top: 0;
        }

        /*깃발*/
        .attend_feria span{
            width: 17px; height: 17px;
            text-align: center;
            line-height: 17px;
            background-color: #e65100;
            position: absolute;
            left: 0; top: 0;
        }
        .attend_feria span::before{
            content: "";
            border-bottom:10px solid transparent;
            border-left:10px solid #e65100;
            position: absolute;
            left: 0; top: 15px;
        }
        .attend_feria span::after{
            content: "";
            border-bottom:10px solid transparent;
            border-right:10px solid #e65100;
            position: absolute;
            right: 0; top: 15px;
        }

        /*깃발*/
        .attend_feria .flag{
            width: 22px; height: 25px;
            text-align: center;
            line-height: 25px;
            position: absolute;
            left: 5px; top: 0px;
        }
        .attend_feria .flag::before{
            content: "";
            position: absolute;
            left: 0; top: 19px;
        }
        .attend_feria .flag::after{
            content: "";
            position: absolute;
            right: 0; top: 19px;
        }
        .attend_feria .flag_b{
            background-color: #e65100;
        }
        .attend_feria .flag_b::before{
            border-bottom:15px solid transparent;
            border-left:15px solid #e65100;
        }
        .attend_feria .flag_b::after{
            border-bottom:15px solid transparent;
            border-right:15px solid #e65100;
        }
        .attend_feria .flag_s{
            background-color: #2196F3;
        }
        .attend_feria .flag_s::before{
            border-bottom:15px solid transparent;
            border-left:15px solid #2196F3;
        }
        .attend_feria .flag_s::after{
            border-bottom:15px solid transparent;
            border-right:15px solid #2196F3;
        } /*--여기까지 깃발ㄹㄹㄹ--*/

        .attend_feria .feria_name{
            position: absolute;
            top: 15px; left: 120px;
            width: 310px;
            font-weight: 400;
            font-size: 20px;
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
        }
        .attend_feria .reservation_time{
            width: 90px;
            height: 20px;
            font-size: 18px;
            position: absolute;
            bottom: 15px;
            left: 120px;
        }
        .attend_feria .situation{
            /*color: #e65100;*/
            border: 1px solid #9e9e9e;
            border-radius: 5px;
            height: 20px;
            width: 80px;
            font-weight: 300;
            font-size: 15px;
            line-height: 8px;
            cursor: pointer;
            position: absolute;
            right: 20px;
            bottom: 15px;
            padding: 5px 0;
        }

        /*핀 컬러*/
        .attend_pin{
            border-radius: 50%;
            position: absolute;
            right: 20px; top: 10px;
            background-color: blueviolet;
            width: 30px; height: 30px;
        }

        .paginate{
            width: 490px;
            bottom: 0;
            font-size: 18px;
            line-height: 35px;
            position: absolute;
            margin: 0;
        }
        .circle{
            width: 20px;
            height: 20px;
            border-radius: 10px;
            background-color: red;
            position: relative;
        }
        .circle::before{
            content: "";
            width: 0;
            height: 0;
            border-top: 15px solid red;
            border-left: 8.5px solid transparent;
            border-right: 8.5px solid transparent;
            position: absolute;
            /*transform: rotateZ(-135deg);*/
            top: 15px;
            left: 1.5px;
        }
        .circle img{
            width: 15px;
            height: 15px;
            border-radius: 7.5px;
            position: absolute;
            top: 2.5px;
            left: 2.5px;
        }
    </style>
</head>
<body>
<div class="wrap_content">
    <div class="attend_feria_header">
        <h2>참가한 페리아</h2>
        <h3>참가한 페리아를 확인해보세요.</h3>
    </div><!--//.attend_feria_header end-->
    <div class="wrap_attend_list">
        <div id="map" style="width:490px;height:490px;"></div>

        <div class="wrap_feria_attend">
            <ul class="list_attend_feria">
            
            
            <c:forEach items="${feriaList }" var="feria">
                <li class="attend_feria"  data-title="${feria.feriaName }" data-lat="${feria.lat}" data-lng="${feria.lng}">
                    <img src="img/${feria.cenaImg }" alt="${feria.cenaName }">
                    <span class="flag flag_b">${feria.cenaType }</span>
                    <div class="feria_name">${feria.feriaName }</div>
                    <div class="reservation_time">
                    <fmt:formatDate value="${feria.feriaDate}" pattern="YYYY.MM.dd"/>
                    </div>
                    <button type="submit" class="situation" name="noneOpen">비공개</button>
                    <div class="attend_pin" style="background-color: #80d2ff"></div>
                </li>
               </c:forEach> 
            </ul>
            <div class=paginate>
                <a href="#" title='이전 페이지로'><i class='fa fa-chevron-left'></i><span class='screen_out'>이전 페이지</span></a>
                <a href="#" title='현재페이지'>1</a>
                <a href="#" title='다음 페이지로'><i class='fa fa-chevron-right'></i><span class='screen_out'>다음 페이지</span></a>
            </div><!--//.paginate end-->
        </div><!--//.wrap_feria_attend end-->
    </div><!--//wrapAttendList end-->
</div><!--//.wrap_content end-->
<c:import url="/WEB-INF/template/footer.jsp"></c:import>
<script src="js/jquery.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cbdad33602748af025c0cc9710e81872"></script>
<script>

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(35.8376843, 127.7305197), // 이미지 지도의 중심좌표
            level: 13, // 이미지 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // var positions = [
    //     {
    //         title: '카카오',
    //         latlng: new kakao.maps.LatLng(33.450705, 126.570677)
    //     },
    //     {
    //         title: '생태연못',
    //         latlng: new kakao.maps.LatLng(33.450936, 126.569477)
    //     },
    //     {
    //         title: '텃밭',
    //         latlng: new kakao.maps.LatLng(33.450879, 126.569940)
    //     },
    //     {
    //         title: '근린공원',
    //         latlng: new kakao.maps.LatLng(33.451393, 126.570738)
    //     }
    // ];


    /*// 마커 이미지의 이미지 주소입니다
    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";*/

    //바운드 지정
    var bounds = new daum.maps.LatLngBounds();

    $(".attend_feria").each(function () {

        var content = '<div>' +
            '    <div class="circle"><img src="img/user.png"/></div>' +
            '    </div>';

        const latlng = new kakao.maps.LatLng(this.dataset.lat, this.dataset.lng);

// 커스텀 오버레이를 생성합니다
        var customOverlay = new kakao.maps.CustomOverlay({
            position: latlng,
            content: content,
            xAnchor: 0.50,
            yAnchor: 1.45
        });

/*

        // 마커 이미지의 이미지 크기 입니다
        var imageSize = new kakao.maps.Size(24, 35);

        // 마커 이미지를 생성합니다
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
*/

        /*// 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: latlng, // 마커를 표시할 위치
            title : this.dataset.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        });
*/
        bounds.extend(latlng);
        //marker.setMap(map);

        // 마커가 지도 위에 표시되도록 설정합니다
        customOverlay.setMap(map);
    })

    // for (var i = 0; i < positions.length; i ++) {
    //
    //     // 마커 이미지의 이미지 크기 입니다
    //     var imageSize = new kakao.maps.Size(24, 35);
    //
    //     // 마커 이미지를 생성합니다
    //     var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
    //
    //     // 마커를 생성합니다
    //     var marker = new kakao.maps.Marker({
    //         map: map, // 마커를 표시할 지도
    //         position: positions[i].latlng, // 마커를 표시할 위치
    //         title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
    //         image : markerImage // 마커 이미지
    //     });
    //
    //     bounds.extend(positions[i].latlng);
    //
    //     // 마커가 지도 위에 표시되도록 설정합니다
    //     marker.setMap(map);
    //
    // }

    map.setBounds(bounds);

    // 마커가 지도 위에 표시되도록 설정합니다
   // marker.setMap(map);
   // marker2.setMap(map);

    // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
    // marker.setMap(null);

    //클릭=> '비공개' -> '공개'텍스트 변경
    $('.situation').click(function(e){
        e.preventDefault();

        if( $(this).html() == '비공개' ) {
            $(this).html('공개');
        }
        else {
            $(this).html('비공개');
        }//if~else end
    });

</script>
</body>
</html>
