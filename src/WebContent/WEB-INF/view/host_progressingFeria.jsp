<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>호스트_진행중인페리아</title>
   <c:import url="/WEB-INF/template/link.jsp"></c:import>
    <link rel="stylesheet" href="css/paginate.css">
    <link rel="stylesheet" href="css/tui-date-picker.css">
    <link rel="icon" href="img/logo.jpg">
    <style>
        /*폰트*/
        body{font-family: 'Noto Sans KR', sans-serif;}

        .wrap_content{
            margin: auto;
            width: 1200px;
            height: 800px;
        }

        /*진행중인페리아 헤더*/
        .wrap_processing_header{
            text-align: center;
            width: 1200px;
            margin: auto;
        }
        .wrap_processing_header h2{
            padding-top: 20px;
            font-size: 30px;
            margin-bottom: 10px;
        }
        .wrap_processing_header h3{
            border-bottom: 1px solid #9e9e9e;
            padding-bottom: 10px;
            margin-bottom: 50px;
        }

        .wrap_progress_feria{
            /*background-color: aquamarine;*/
            width: 1200px; height: 620px;
            position: relative;
            margin: auto;
        }


        /*달력 datepicker*/
        .calendar{
            /*background-color: blueviolet;*/
            width: 550px; height: 620px;
            position: relative;
            left: 0; top: 0;
        }
        .calendar .calender_confirm_text{
            /*background-color: yellowgreen;*/
            height: 25px;
            width: 255px;
            text-align: center;
            line-height: 25px;
            font-size: 25px;
            display: block;
            position: absolute;
            top: 15px; left: 150px;
        }
        .tui-datepicker {
            border: none;
            top: 75px;
        }
        .tui-datepicker .tui-is-selectable.tui-is-selected, .tui-datepicker.tui-rangepicker .tui-is-selectable.tui-is-selected{
            background-color: #E61000;
        }
        .tui-datepicker-input.tui-datetime-input.tui-has-focus{
            display: none;
        }
        .tui-calendar td{
            vertical-align: middle;
        }
        .tui-datepicker .tui-calendar{
            width: 550px;
            height: 500px;
            /*top: 100px;*/
            border: 1px solid #9e9e9e;
        }
        .tui-calendar td{
            height: 60px;
            font-size: 18px;
        }
        .tui-calendar .tui-calendar-title{
            font-size: 20px;
        }
        .tui-calendar-body-header{
            font-size: 15px;
            line-height: 40px;
        }
        .tui-datepicker-type-date{
            width: 550px;
            height: 500px;
        }


        .wrap_progress{
            /*background-color: coral;*/
            width: 550px; height: 620px;
            position: absolute;
            right: 0; top: 0;
        }
        .list_progress_feria{

        }
        .list_progress_feria::after{
            content: "";
            display: block;
            clear: both;
        }
        .progress_feria{
            /*background-color: plum;*/
            float: left;
            position: relative;
            width: 550px;
            height: 130px;
            border: 1px solid #9e9e9e;
            margin-bottom: 15px;
        }
        .feria_img{
            height: 130px; width: 130px;
            position: absolute;
            left: 0; top: 0;
        }
        .feria_user_wrap{
           position: absolute;
            left: 150px; top:35px;
           width:300px;
           
        } 
        
         .feria_user_box{
           float:left;
        } 
        .feria_user_box img{
           margin-left:10px;
           border-radius: 50%;
        } 
        
        .feria_date{
            font-size: 25px;
            position: absolute;
            left: 140px; bottom: 15px;
        }
        .feria_time{
            font-size: 25px;
            position: absolute;
            right: 100px; bottom: 15px;

        }
        .feria_person{
            font-size: 40px;
            position: absolute;
            right: 15px; top: 40px;
        }

        /*깃발*/
        .flag{
            width: 27px; height: 27px;
            text-align: center;
            line-height: 27px;
            position: absolute;
            right: 5px; top: 0px;
        }
        .flag::before{
            content: "";
            position: absolute;
            left: 0; top: 25px;
        }
        .flag::after{
            content: "";
            position: absolute;
            right: 0; top: 25px;
        }

        .flag_b{
            background-color: #e65100;
        }
        .flag_b::before{
            border-bottom:15px solid transparent;
            border-left:15px solid #e65100;
        }
        .flag_b::after{
            border-bottom:15px solid transparent;
            border-right:15px solid #e65100;
        }
        .flag_s{
            background-color: #2196F3;
        }
        .flag_s::before{
            border-bottom:15px solid transparent;
            border-left:15px solid #2196F3;
        }
        .flag_s::after{
            border-bottom:15px solid transparent;
            border-right:15px solid #2196F3;
        } /*--여기까지 깃발--*/

        .feria_guest_new{
            background-color: #e65100;
            width: 25px;
            height: 25px;
            text-align: center;
            line-height: 25px;
            border-radius: 50%;
            position: absolute;
            left: -5px; top: -5px;
        }
        .paginate{
            font-size: 20px;
            margin: 0;
            width: 550px;
            height: 35px;
        }
    </style>
</head>
<body>
<div class="wrap_content">
    <div class="wrap_processing_header">
        <h2>진행중인 페리아</h2>
        <h3>등록된 페리아를 확인해 보세요.</h3>
    </div><!--//.wrap_processing_header end-->
    <div class="wrap_progress_feria">
        <div class="calendar">
            <span class="calender_confirm_text">달력으로 확인해 볼까요?</span>
            <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                <input type="text" id="datepicker-input" aria-label="Date-Time">
                <span class="tui-ico-date"></span>
            </div>
            <div id="wrapper" style="margin-top: -1px;"></div>

        </div>
        <div class="wrap_progress">
            <ul class="list_progress_feria">
            <c:forEach items="${feriaLists }" var="feriaList"  >
                <li class="progress_feria">
               
                    <div class="feria_img"><img src="/img/${feriaList.cenaImg }" width=130  height=130 alt="cenaImg"></img></div>

                     
                    	<div class="feria_user_wrap">
                    	
                     <div class="feria_user_box"><img src="/img/4.jpg" width=50  height=50 alt="profileImg"/>  </div>
                     <div class="feria_user_box"><img src="/img/4.jpg" width=50  height=50 alt="profileImg"/>  </div>
                     <div class="feria_user_box"><img src="/img/4.jpg" width=50  height=50 alt="profileImg"/>  </div>
                     <div class="feria_user_box"><img src="/img/4.jpg" width=50  height=50 alt="profileImg"/>  </div>
                     <div class="feria_user_box"><img src="/img/4.jpg" width=50  height=50 alt="profileImg"/>  </div>
                   
                    </div>
                   
                   
				    <div class="feria_date">
				    <fmt:formatDate value="${feriaList.feriaDate}" pattern="YYYY년 MM월 dd일"/>
				     </div>
                   
                    <div class="feria_time">${feriaList.getDay()}</div>
                   
                    <div class="feria_person">0/${feriaList.maxCount }</div>
                    <span class="flag flag_s">${feriaList.cenaType }</span>
                </li>
            </c:forEach>
              
                
            </ul><!--//.list_progress_feria end-->
            ${paginate }<!--//.paginate end-->
        </div><!--//.wrap_progress end-->
    </div><!--//.wrap_progress_feria end-->
</div>
<c:import url="/WEB-INF/template/footer.jsp"></c:import>
<script src="js/jquery.js"></script>
<script src="js/moment-with-locales.js"></script>
<script src="js/tui-date-picker.js"></script>
<script>

    var datepicker = new tui.DatePicker('#wrapper', {
        date: new Date(),
        input: {
            element: '#datepicker-input',
            format: 'yyyy-MM-dd'
        },
        showAlways:true,
        type:"date",
        language:"ko"
    });//이때 datepicker가 만들어짐

    
/*     $('#datepicker1').datepicker(

    		{

    			format: "yyyy-mm-dd",

    			language: "kr",

    			

    			onSelect: function (dateText, inst) 

    			{

    	                      alert('선택하신 날짜가 ' + $("#datepicker1").val() + ' 맞습니까?');

    	                }

    		}); */
    		
    		$("body").on("click",".tui-is-selectable",function(){
    			let timestamp = $(this).data("timestamp")
    			d = new Date(timestamp );
    			let month = d.getMonth()+1
    			let date = d.getDate()
    			alert(month + "-" + date)
    			
    		})
    
</script>
</body>
</html>
