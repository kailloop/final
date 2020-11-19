<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="기념일" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<style>
	
	#search_input{
		border: red 2px solid;   
		width:450px;
        height: 37px;
        font-size: 15px;
		outline-style: none;
		margin-right: 10px;
	}
	#name_search{
		background:#FCFCFC; 
		width:1000px; 
		height:160px; 
		margin-left: auto; 
		margin-right: auto;
		text-align: center;
		margin-top: 100px;
		border-radius: 10px;
	}
	
	#search_btn{
		width: 100px;	
	}
	tr{
		text-align: center;
		cursor: pointer;
	}
	.search{
		width: 47.5%;
		position:relative;
		margin-left:auto;
		margin-right:auto;
		cursor:pointer;
		color:#F26A8D;
		width:200px;
		max-width:200px;
	}
	.day{
		width: 47.5%;
		position:relative;
		margin-left:auto;
		margin-right:auto;
		cursor:pointer;
		width:200px;
		max-width:200px;
	}
	#menu_div{
		width:1400px;
		height:140px;
		position:relative;
		z-index:1;
		margin:0;
		margin-left:auto;
		margin-right:auto;
		padding:0;
		color:lightgray;
		font-family:Nanum Gothic Coding;
		font-weight:bolder;
		font-size:64px;
	}

	#menu_select{
		position:relative;
		top:0px;
		left:21%;
		border-bottom:3px pink solid;
		width:24.5%;
		transition:1s;
	}	
</style>

    
</div>
	
		
		
		<div id="menu_div">
			<table style="width: 60%; margin-left: auto; margin-right: auto;">
				<tr style="cursor: pointer; text-align: center;">
					<td class="search">
						<label style="font-size: 100%;">이름검색</label>
						<!-- <a href="#" style="font-size:100%;">이름검색</a> -->	
					</td>
					<td style="width:5%;">
						<label> ㅣ </label>
					</td>
					<td class="day">
						<label style="font-size: 100%;">날짜검색</label>
					</td>
				</tr>
			</table>
			<div id="menu_select"></div>
		</div>
		
		<!-- 이름검색 -->
		<div id="name_search">
			<div class="search_view">
				<input type="text" id="search_input">
				<button type="button" id="search_btn" class="btn btn-outline-danger">Search</button>
				<br>
				<a href="#" style="color: #4374D9; pointer-events:none; cursor:default;">인기검색어 : </a>
				&nbsp;
				<a href="#" style="color: #4374D9;"># 크리스마스</a>
				&emsp;
				<a href="#" style="color: #4374D9;"># 100일</a>
				&emsp;
				<a href="#" style="color: #4374D9;"># 발렌타인데이</a>
				&emsp;
				&emsp;&emsp;&emsp;&emsp;&emsp;
				
				<hr style="margin-right: 100px; margin-left:100px;">
			</div>
			
			<div class="list_view">
			</div>
		</div>
		
		
		
<style>
/* 데이터피커디자인 */
	.search_view {
		margin-left: auto;
		margin-right: auto;
		padding-top: 50px;
	}
	
	/*달력위에날짜나오는곳*/
	.ui-datepicker-title {
		font-weight: 500;
	}
	
	
	/* 주말색바꾸기
	.ui-datepicker-week-end{color:red;}
	.ui-datepicker-week-end .ui-state-default{color:red;} */
	
	/*토요일색*/
	.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:last-child a { color:blue; }
    /*일요일색 */
    .ui-datepicker-calendar > tbody td.ui-datepicker-week-end:first-child a { color:red; }
    
    </style>
		
		<!-- 날짜검색 -->
		<div id="day_search" style="display: none;">
			<div class="search_view">
				<input type="text" id="test_input">
		        
				<!-- 달력부분 -->
		        <div class='datepicker'></div>
	       		
	       		<hr style="margin-right: 100px; margin-left:100px;">
			</div>
			
			<div class="list_view">
			</div>
		</div>
		
		
</section>	
	
	
	<script>
		$(function() {
			$(".search").click(function(){
				$(".search").css("color","#F26A8D");
				$(".day").css("color","lightgray");
				$("#menu_select").css("left","21%");
				$("#name_search").show();
				$("#day_search").hide();
			});
			
			$(".day").click(function() {
				$(".search").css("color","lightgray");
				$(".day").css("color","#F26A8D");
				$("#menu_select").css("left","55%");
				$("#name_search").hide();
				$("#day_search").show();
			});

			
			$( ".datepicker" ).datepicker({
				dateFormat: "yy-mm-dd",
				duration: "fast",
			 	nextText: '다음 달',
	        	prevText: '이전 달',
	        	//input text안에 값넣어주는거
	        	altField:"#test_input",
	        	//최소선택날짜
	        	minDate:"today",
	        	//최대선택날짜
	        	maxDate:"+1Y",
	        	//년도나오고 월나오게
	        	showMonthAfterYear:true,
	        	//달력위에 년도 뒤에붙는 글자
	        	yearSuffix:"년",
	        	//달력의 월 부분 텍스트
	        	monthNamesShort:['1','2','3','4','5','6','7','8','9','10','11','12'], 
	        	//달력의 월 부분 Tooltip 텍스트
	        	monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        	//달력의 요일 부분 텍스트
	            dayNamesMin:['일','월','화','수','목','금','토'], 
	          	//달력의 요일 부분 Tooltip 텍스트
	            dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
	            
	        	//콤보박스
	        	/* changeYear:true,
	        	changeMonth:true */
	        	
	        	
			});
			
		});
		
		
	</script>
	

</body>
</html>


