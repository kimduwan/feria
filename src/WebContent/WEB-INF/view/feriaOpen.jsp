<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>페리아 참가하기</title>
    <link rel="icon" href="/img/logo.jpg">
    <c:import url="/WEB-INF/template/link.jsp"></c:import>
    <link rel="stylesheet" href="css/feriaopen.css" />
    <link rel="stylesheet" href="css/tui-date-picker.css" />
    <link rel="stylesheet" href="css/tui-time-picker.css" />
    <style>
        .tui-datepicker .tui-is-selectable.tui-is-selected {
            background: #e65100;
        }
        #wrapper .tui-datepicker .tui-calendar-container{
            background-color: #fff;
        }
        #wrapper{
            position: absolute;
            z-index: 5;
        }
    </style>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"></c:import>
<div id="wrapContent">
    <h2 class="first_header">페리아 오픈</h2>
    <h3 class="second_header">페리아를 오픈해 게스트를 초대해보세요.</h3>
    <div class="feria_open_formbox">
        <form action="/addFeria.feria" method="post">
            <input type="hidden" value="" name="lat" id="lat">
            <input type="hidden" value="" name="lng" id="lng">
            <input type="hidden" value="${cenaNo}" name="cenaNo" id="cenaNo">
            <input type="hidden" value="" name="cityNo" id="cityNo">
            <fieldset>
                <legend class="screen_out">페리아 오픈 폼</legend>
                <div class="wrap_500px left">
                    <div class="wrap_feria_name row full">
                        <label for="feriaName" class="screen_out">페리아 이름</label>
                        <input type="text" name="feriaName" id="feriaName" placeholder="페리아 제목을 입력하세요.">
                    </div>

                    <div class="feria_address row full">
                        <h3>주소</h3>
                        <label for="postcode" class="screen_out">우편번호</label>
                        <input type="text" name="postcode" id="postcode" placeholder="우편번호" readonly class="sub_row">
                        <button class="btn" type="button" id="searchBtn">우편번호 찾기</button>
                        <div class="sub_row">
                            <label for="address1" class="screen_out">주소</label>
                            <input name="feriaAddress" type="text" id="address1" placeholder="주소" size="50" readonly>
                        </div>
                        <div class="sub_row">
                            <label for="address2" class="screen_out">상세주소</label>
                            <input name="detailAddress" type="text" id="address2" placeholder="상세주소" size="50">
                        </div>
                    </div><!--//.feria_address-->
                </div><!--//.wrap_500px left-->
                <div class="wrap_500px">
                    <div class="wrap_feria_headCount  row full">
                        <h3>인원</h3>
                        <div>
                            <label for="minHeadCount" class="screen_out">최소</label>
                            <input type="number" name="minCount" id="minHeadCount" placeholder="최소 인원" min="1" max="6">
                        </div><!--#minHeadCount-->
                        <div>
                            <label for="maxHeadCount" class="screen_out">최대</label>
                            <input type="number" name="maxCount" id="maxHeadCount" placeholder="최대 인원" min="1" max="6">
                        </div><!--#maxeadCount-->
                    </div><!--//.wrap_feria_headCount-->
                    <div class = "feria_time row full">
                        <h3 class="mid_header">시간</h3>
                        <div class="feria_time_radio">
                            <input type="radio" name="mealType"  value="B" class="btn_filter" id="breakfast">
                            <label for="breakfast" >아침</label>
                            <input type="radio" name="mealType"  value="L" class="btn_filter" id="lunch">
                            <label for="lunch">점심</label>
                            <input type="radio" name="mealType"  value="D" class="btn_filter" id="dinner" checked>
                            <label for="dinner" class="on">저녁</label>
                        </div><!--//.wrap_bibe_category-->
                        <div class="feria_time_input">
                            <input type="time" name="feriaHour" id="feriaTime">
                        </div>
                    </div><!--//.feria_time-->
                    <div class="feria_date row full">
                        <h3>일시</h3>
                        <div class="datepicker_input">
                            <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                                <input type="text" id="datepicker-input" aria-label="Date-Time">
                                <div id="wrapper"></div>
                                <span class="tui-ico-date"></span>
                            </div><!--//datepicker-->
                        </div><!--//datepicker_input-->
                        <div class="date_range_output">
                            <div class="date_range_start"></div>
                            <span> ~</span>
                            <div class="date_range_end"> </div>
                            <button class="btn_delete_repeat"></button>
                        </div><!--//date_range_output-->
                        <button type="button" class="btn_repeat btn">추가</button>
                        <div id="wrapRepeat" class="test">
                            <div>
                                <div class="wrap_repeat">
                                    <h3>반복</h3>
                                    <div class = "wrap_repeat_cycle">
                                        <h4 class="mid_header">주기</h4>
                                        <div class="repeat_cycle">
                                            <input type="checkbox" name="repeatCycle"  value="" class="btn_filter" id="monday">
                                            <label for="monday">월</label>
                                            <input type="checkbox" name="repeatCycle"  value="" class="btn_filter" id="tuesday">
                                            <label for="tuesday">화</label>
                                            <input type="checkbox" name="repeatCycle"  value="" class="btn_filter" id="wednesday">
                                            <label for="wednesday">수</label>
                                            <input type="checkbox" name="repeatCycle"  value="" class="btn_filter" id="thursday">
                                            <label for="thursday">목</label>
                                            <input type="checkbox" name="repeatCycle"  value="" class="btn_filter" id="friday">
                                            <label for="friday">금</label>
                                            <input type="checkbox" name="repeatCycle"  value="" class="btn_filter" id="saturday">
                                            <label for="saturday">토</label>
                                            <input type="checkbox" name="repeatCycle"  value="" class="btn_filter" id="sunday">
                                            <label for="sunday">일</label>
                                        </div><!--//repeat_cycle-->
                                    </div><!--//wrap_repeat_cycle-->
                                    <div class = "wrap_date_range">
                                        <h4>기간</h4>
                                        <div class="date_range">
                                            <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                                                <input id="startpicker-input" type="text" aria-label="Date">
                                                <span class="tui-ico-date"></span>
                                                <div id="startpicker-container" style="margin-left: -1px;"></div>
                                            </div>
                                            <span>~</span>
                                            <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                                                <input id="endpicker-input" type="text" aria-label="Date" autocomplete="none">
                                                <span class="tui-ico-date"></span>
                                                <div id="endpicker-container" style="margin-left: -1px;"></div>
                                            </div>
                                        </div><!--//.date_range-->
                                    </div><!--//.wrap_date_range-->
                                </div>
                                <button class="btn_close"></button>
                                <button class="btn_confirm">적용</button>
                            </div>
                        </div><!--//#wrapRepeat-->
                    </div>
                </div><!--//.wrap_500px right-->
                    <div class="wrap_time_list">
                        <ul class="time_list">

                        </ul>
                    </div><!--//.wrap_time_list end-->
                <button class="btn_next btn" type="submit">등록</button>
            </fieldset>
        </form><!--//form-->
    </div><!--//.feria_open_formbox-->
</div><!--//#wrapContent-->
<div id="map" style="width:0;height:0;display: none"></div>
<c:import url="/WEB-INF/template/footer.jsp"></c:import>

<script type="text/template" id="addDateTmpl">
    <li class="wrapDateItem">
        <div class="wrap_date_item">
        <div class="open_date"></div>
        <input type="hidden" name="feriaDate" class="mealDateVal" value="">
        <button href="#" class="btn_delete"></button>
        </div>
    </li>
</script>

<script src="js/underscore-min.js"></script>
<script src="js/tui-time-picker.js"></script>
<script src="js/tui-date-picker.js"></script>
<script src="js/jquery.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=99ec963582528980c646c0106af62bba&libraries=services"></script>
<script src="js/moment-with-locales.js"></script>
<script>

    var $postcode = $("#postcode");
    var $address1 = $("#address1");
    var $address2 = $("#address2");

    var width = 500; //팝업의 너비
    var height = 600; //팝업의 높이

    var themeObj = {
        bgColor: "#162525", //바탕 배경색
        searchBgColor: "#162525", //검색창 배경색
        contentBgColor: "#162525", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
        pageBgColor: "#162525", //페이지 배경색
        textColor: "#FFFFFF", //기본 글자색
        queryTextColor: "#FFFFFF", //검색창 글자색
        //postcodeTextColor: "", //우편번호 글자색
        //emphTextColor: "", //강조 글자색
        outlineColor: "#444444" //테두리
    };
// 우편번호 api

    let fullAddr = "";
    let detaileAddr = "";
    let lng = "";
    let lat = "";
    let cityNo = "";

    $("#searchBtn,#postcode").click(function () {

        new daum.Postcode({
            //theme:themeObj,
            width: width, //생성자에 크기 값을 명시적으로 지정해야 합니다.
            height: height,
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                fullAddr = ''; // 최종 주소 변수
                extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $postcode.val(data.zonecode); //5자리 새우편번호 사용

                //alert(fullAddr);
                $address1.val(fullAddr);

                //위도, 경도 얻어오기.
                var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                    mapOption = {
                        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                        level: 3 // 지도의 확대 레벨
                    };

                // 지도를 생성합니다
                var map = new kakao.maps.Map(mapContainer, mapOption);

                // 주소-좌표 변환 객체를 생성합니다
                var geocoder = new kakao.maps.services.Geocoder();

                // 주소로 좌표를 검색합니다
                geocoder.addressSearch(fullAddr, function(result, status) {
                	
                	

                    // 정상적으로 검색이 완료됐으면
                    if (status === kakao.maps.services.Status.OK) {
                    	
                    	console.log(result[0]);
                    	
                    	console.log(result[0].address.region_2depth_name);
                    	console.log(result[0].address.region_1depth_name);
                    	
                    	cityNo = result[0].address.region_2depth_name;
                    	$("#cityNo").val(cityNo);

                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                        // 결과값으로 받은 위치를 마커로 표시합니다
                        var marker = new kakao.maps.Marker({
                            map: map,
                            position: coords
                        });

                        // 인포윈도우로 장소에 대한 설명을 표시합니다
                        var infowindow = new kakao.maps.InfoWindow({
                            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
                        });
                        infowindow.open(map, marker);
                        lng = coords.Ga;
                        lat = coords.Ha;
                        console.log("경도 : "+lng);
                        console.log("위도 : "+lat);
                        $("#lng").val(lng);
                        $("#lat").val(lat);
                        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                        map.setCenter(coords);
                    }
                });

                // 커서를 상세주소 필드로 이동한다.
                $address2.focus();


            }


        }).open({
            left: (window.screen.width / 2) - (width / 2),
            top: (window.screen.height / 2) - (height / 2)
            ,popupName: '멋진 웹서비스'});

    });




    $address2.keyup(function () {
        detaileAddr = $(this).val();
        console.log(fullAddr);
        console.log(detaileAddr);

        console.log(lng);
        console.log(lat);
    })

</script>
<!--지도 api-->

<script>

    $startpickerInput = $("#startpicker-input");
    $dateRangeStart = $(".date_range_start");
    $dateRangeEnd = $(".date_range_end");
    $dateRangeOutput = $(".date_range_output");
    $datepickerInput = $(".datepicker_input");
    $btnDeleteRepeat = $(".btn_delete_repeat");
    /*2020.08.10*/
    /*삭제 버튼*/
    $btnDelete = $(".btn_delete");
    /*날짜 추가 템플릿*/
    $addDateTmp = _.template($("#addDateTmpl").html());

    const $btnClose = $(".btn_close");
    const $btnRepeat = $(".btn_repeat");
    const $btnConfirm = $(".btn_confirm");
    const $wrapRepeat = $("#wrapRepeat");

    const $btnFilterLabel = $(".btn_filter+label");


    var datepicker = new tui.DatePicker('#wrapper', {
        date: new Date(),
        input: {
            element: '#datepicker-input',
            format: 'yyyy-MM-dd'
        },
        language:'ko',
        timePicker:true
    });



    /*팝업 닫는 이벤트*/

    /*$btnClose.click(function (e) {
        e.preventDefault();
        //$wrapRepeat.hide();
    });
    $btnConfirm.click(function (e) {
        e.preventDefault();
        $wrapRepeat.hide();
        $datepickerInput.hide();
        $dateRangeOutput.show();
        $btnRepeat.css("left",265);
    });*/


    var today = new Date();
    var picker = tui.DatePicker.createRangePicker({
        startpicker: {
            date: today,
            input: '#startpicker-input',
            container: '#startpicker-container'
        },
        endpicker: {
            date: today,
            input: '#endpicker-input',
            container: '#endpicker-container'
        },
        selectableRanges: [
            [today, new Date(today.getFullYear() + 1, today.getMonth(), today.getDate())]
        ],
        language:'ko'
    });

    let mealTypeTxt = null;
    let mealTypeVal = null;

    $btnFilterLabel.on("click",function (e) {
        e.preventDefault();
        let id = $(this).attr("for");
        mealTypeTxt = $(this).text();
        mealTypeVal = $(this).val();
        $("#"+id).attr('checked',function(){
            return !$(this).attr('checked');
        });
        $(".feria_time_radio > label").removeClass("on");
        $(this).addClass("on");
        console.log(id);
    });

    //기간 시작일 가져오기
    let feriaDate = null;
    //기간 시작시간 가져오기
    let feriaTime = null;

    $("#wrapper").on("click",".tui-is-selectable",function(){
       /* var date = moment(picker.getStartDate());
        console.log(date);
        feriaDate = date;*/
        //feriaDate = $datepickerInput.val();
        /*const mealDate = moment(picker.getDate());
        feriaDate = mealDate.format("YYYY-MM-DD");*/
        feriaDate = $("#datepicker-input").val();
        console.log(feriaDate);
        feriaTime = $("#feriaTime").val();
        console.log(feriaTime);
    });






    /*picker.on('change:start', function() {
        const startDate = moment(picker.getStartDate());
        console.log(startDate.format("YYYY-MM-DD"));
        $dateRangeStart.text(startDate.format("YYYY-MM-DD")+" ");
        feriaDate = startDate.format("YYYY-MM-DD");
    });*/

    /*console.log(feriaDate);

    picker.on('change:end', function() {
        const endDate = moment(picker.getEndDate());
        console.log(endDate);
        $dateRangeEnd.text(" "+endDate.format("YYYY-MM-DD"));
    });*/

    /*$btnDeleteRepeat.on("click",function () {
        $datepickerInput.show();
        $dateRangeOutput.hide();
        $dateRangeStart.empty();
        $dateRangeEnd.empty();
    });*/

    $btnDelete.on("click",function (e) {
        e.preventDefault();
    })



    /*날짜 추가 버튼*/
    $btnRepeat.click(function (e) {
        e.preventDefault();
        //$wrapRepeat.show();
        let lastIdx = $(".time_list>li").length;
        console.log(lastIdx);

        /*console.log(datepicker.getDate());
        const nowDate = datepicker.getDate();
        feriaDate = nowDate.format("YYYY-MM-DD");
        console.log(feriaDate);*/
        if (mealTypeTxt==null){
            mealTypeTxt = "저녁";
        }

        $(".time_list").append($addDateTmp);
        $(".time_list>li").eq(lastIdx).find(".open_date").text(feriaDate);
        $(".time_list>li").eq(lastIdx).find(".mealDateVal").val(feriaDate);
        $(".time_list>li").eq(lastIdx).find(".open_time").text(feriaTime);
        $(".time_list>li").eq(lastIdx).find(".mealTimeVal").val(feriaTime);
        $(".time_list>li").eq(lastIdx).find(".mealType").text(mealTypeTxt);

        
		if(mealTypeTxt=="아침"){
			$(".time_list>li").eq(lastIdx).find(".mealTypeVal").val("B");
        }else if(mealTypeTxt=="점심"){
        	$(".time_list>li").eq(lastIdx).find(".mealTypeVal").val("L");
        }else{
        	$(".time_list>li").eq(lastIdx).find(".mealTypeVal").val("D");
        }

    })

    /*날짜 삭제 버튼*/
    $(".time_list").on("click",".btn_delete",function (e) {
        e.preventDefault();
        /*$datepickerInput.show();
        $dateRangeOutput.hide();
        $dateRangeStart.empty();
        $dateRangeEnd.empty();*/
        $(this).parent().parent().hide();
        $(this).parent().parent().empty();
    })

</script>
</body>
</html>