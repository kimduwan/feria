<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Cena List</title>
    <link rel="icon" href="img/logo.jpg">
    <link href="css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/notosanskr.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/tui-date-picker.css">
    <link rel="stylesheet" href="css/flag.css">
    <style>
        #wrapContent{
            width: 1200px;
            margin: 100px auto 100px;
            position: relative;
        }
        #wrapContent legend{
            display: none;
        }
        .btn_cena_regist{
            position: absolute;
            right: 0;
            top: 90px;
            width: 100px;
            height: 40px;
            border-radius: 5px;
            background-color: #E65100;
            border: none;
            font-size: 20px;
            color: #ffffff;
            cursor: pointer;
            text-decoration: none; line-height: 40px; text-align: center;
        }
        #wrapContent h2{
            font-size: 36px;
            text-align: center;
        }
        #wrapContent h3{
            margin-top: 5px;
            margin-bottom: 50px;
            font-size: 20px;
            border-bottom: 1px solid #9e9e9e;
            text-align: center;
            padding: 10px;
        }
        .list_cena{
            width: 1000px;
            min-height: 200px;
            margin: auto;
        }
        .list_cena .wrap_cena_info{
            border: 1px solid #424242;
            width: 800px;
            height: 200px;
            margin: 10px auto;
            position: relative;
        }
        .list_cena .wrap_list_cena_image{
            width: 200px;
            height: 200px;
            position: absolute;
            left: 0;
        }
        .list_cena .wrap_list_cena_image img{
            width: 200px;
            height: 200px;
            display: block;
        }
        .wrap_list_cena_info{
            width: 450px;
            height: 200px;
            position: absolute;
            left: 210px;
        }
        .wrap_list_cena_info h4{
            width: 400px;
            height: 50px;
            line-height: 50px;
            font-size: 20px;
            text-align: left;
            margin-left: 10px;
        }
        .wrap_list_cena_info .cena_category{
            display: block;
            width: 80px;
            height: 40px;
            margin-top: 25px;
            text-align: center; line-height: 40px;
            border: 1px solid #9e9e9e;
            border-radius: 15px;
            margin-left: 10px;
        }
        .wrap_list_cena_info .list_cena_serve{
            width: 400px;
            height: 50px;
            margin-top: 23px;
        }
        .wrap_list_cena_info .list_cena_serve li{
            float: left;
            width: 98px;
            height: 48px;
            border: 1px solid #9e9e9e;
            border-radius: 15px;
            text-align: center; line-height: 50px;
            margin-left: 10px;
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
        }
        .btn_feria_open{
            position: absolute;
            right: 20px;
            bottom: 10px;
            width: 100px;
            height: 50px;
            background-color: #2196F3;
            text-align: center; line-height: 50px;
            color: #fff; font-size: 15px;
            border: none; border-radius: 5px;
            cursor: pointer; text-decoration: none;
        }
    </style>
</head>
<body>
<div id="wrapContent">
    <a href="#" target="_blank" class="btn_cena_regist">세나 등록</a>
    <h2>자신의 세나를 확인해보세요.</h2>
    <h3>페리아 오픈하기</h3>
    <ul class="list_cena">

    </ul> 
</div>

<script type="text/template" id="cenaTmpl">
    <@_.each(cenas,function(cena) {@>
    <li class="wrap_cena_info flag flag_<@=cena.cenaType@>">
        <div class="wrap_list_cena_image"><img src="/img/<@=cena.cenaImg@>" alt=""></div>
        <div class="wrap_list_cena_info">
            <h4><@=cena.cenaName@></h4>
            <strong class="cena_category"><@=cena.mealTypeStr@></strong>
            <ul class="list_cena_serve">
                <@_.each(cena.cnDishes,function(cnDish){@>
                <li><@=cnDish@></li>
                <@})@>
            </ul>
        </div>
        <a href="#" target="_blank" class="btn_feria_open">페리아 오픈</a>
    </li>
    <@})@>
</script>

<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script>

	_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

    const $listCena = $(".list_cena");

    const cenaTmp = _.template($("#cenaTmpl").html());
    

    //cena를 ajax로 얻어오는 메서드
    function getCena() {
		
        $.ajax({
            url:"/ajax/getCenas.feria",
            error:function () {
                alert("에러!");
            },
            data:{
            	userNo:${loginUser.no}
            },
            dataType:"json",
            success:function (json) {
                console.log(json.cenas);
                $listCena.append(cenaTmp({cenas:json.cenas})); //json이 뒤로

            }
        });//$.ajax() end

    }//getLocation()

    getCena();
</script>