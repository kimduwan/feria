<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/notosanskr.css">
    <link rel="stylesheet" href="css/reset.css">
    <style>
        /*폰트*/
        body{font-family: 'Noto Sans KR', sans-serif;}

        .gestTabmenu{
            height: 40px;
            width: 1200px;
            margin: 60px auto;
        }

        .gestTabmenu ul li{
            display:  inline-block;
            float:left;
            margin-right: 20px;
            text-align:center;
        }

        .gestTabmenu ul li a{
            display:  block;
            float:left;
            margin-right: 20px;
            text-align:center;
            width:100%;
            height:40px;
            line-height:35px;
            font-size: 25px;
            text-decoration: none;
            color: #424242;
        }

        .guestOn{
            border-bottom: 2px solid rgb(34,34,34);
        }

        #pageArea{
        }

    </style>

</head>
<body>


<!--게스트 탭 끝-->
<div class="gestTabmenu">
    <ul>
        <li id="gestTab1" >
            <a href="/guest_participatedFeria.jsp" class="btnCon">참가한 페리아</a>
        </li>

        <li id="gestTab2" >
            <a href="/guest_reserveFeria.jsp" class="btnCon">예약 리스트</a>
        </li>

        <li id="gestTab3" >
            <a href="/bibe_list.jsp" class="btnCon">비베 리스트</a>
        </li>
    </ul>
</div>
<div id="pageArea">

</div>
<!--게스트 탭 끝-->

<script src="js/jquery.js"></script>
<script>

    $(".btnCon").click(function () {
        $(this).addClass("guestOn");
        $(this).parent().siblings().children().removeClass("guestOn");
    })//.btnCon click end


</script>

</body>
</html>