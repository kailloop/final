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
		<br><br><br><br><br><br>
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
		</div>
		
		
		
		
<style>
/* 데이터피커디자인 */
	.wrapper {
		max-width: 18rem;
		padding: 0 0.5rem;
		margin-left: auto;
		margin-right: auto;
		padding-top: 4rem;
	}
	#datepicker {
		font-size: 0.75rem;
		font-weight: 400;
		display: block;
		margin-bottom: 0.5rem;
		color: #B0BEC5;
		border: 1px solid #ECEFF1;
		padding: 0.5rem 0.75rem;
		border-radius: 0.5rem;
	}
	#datepicker_input {
		font-family: 'Roboto', sans-serif;
		display:block;
		border: none;
		border-radius: 0.25rem;
		border: 1px solid transparent;
		line-height: 1.5rem;
		padding: 0;
		font-size: 1rem;
		color: #607D8B;
		width: 100%;
		margin-top: 0.5rem;
	}
	#datepicker_input:focus {outline: none;}
	#ui-datepicker-div {
		display: none;
		background-color: #fff;
		box-shadow: 0 0.125rem 0.5rem rgba(0,0,0,0.1);
		margin-top: 0.25rem;
		border-radius: 0.5rem;
		padding: 0.5rem;
	}
	table {
		border-collapse: collapse;
		border-spacing: 0;
	}
	.ui-datepicker-calendar thead th {
		padding: 0.25rem 0;
		text-align: center;
		font-size: 0.75rem;
		font-weight: 400;
		color: #78909C;
	}
	.ui-datepicker-calendar tbody td {
		width: 2.5rem;
		text-align: center;
		padding: 0;
	}
	.ui-datepicker-calendar tbody td a {
		display: block;
		border-radius: 0.25rem;
		line-height: 2rem;
		transition: 0.3s all;
		color: #546E7A;
		font-size: 0.875rem;
		text-decoration: none;
	}
	.ui-datepicker-calendar tbody td a:hover {
		background-color: #E0F2F1;
	}
	.ui-datepicker-calendar tbody td a.ui-state-active {
		background-color: #009688;
		color: white;
	}
	.ui-datepicker-header a.ui-corner-all {
		cursor: pointer;
		position: absolute;
		top: 0;
		width: 2rem;
		height: 2rem;
		margin: 0.5rem;
		border-radius: 0.25rem;
		transition: 0.3s all;
	}
	.ui-datepicker-header a.ui-corner-all:hover {
		background-color: #ECEFF1;
	}
	.ui-datepicker-header a.ui-datepicker-prev {
		left: 0;
		background: url("data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMyIgaGVpZ2h0PSIxMyIgdmlld0JveD0iMCAwIDEzIDEzIj48cGF0aCBmaWxsPSIjNDI0NzcwIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik03LjI4OCA2LjI5NkwzLjIwMiAyLjIxYS43MS43MSAwIDAgMSAuMDA3LS45OTljLjI4LS4yOC43MjUtLjI4Ljk5OS0uMDA3TDguODAzIDUuOGEuNjk1LjY5NSAwIDAgMSAuMjAyLjQ5Ni42OTUuNjk1IDAgMCAxLS4yMDIuNDk3bC00LjU5NSA0LjU5NWEuNzA0LjcwNCAwIDAgMS0xLS4wMDcuNzEuNzEgMCAwIDEtLjAwNi0uOTk5bDQuMDg2LTQuMDg2eiIvPjwvc3ZnPg==");
		background-repeat: no-repeat;
		background-size: 0.5rem;
		background-position: 50%;
		transform: rotate(180deg);
	}
	.ui-datepicker-header a.ui-datepicker-next {
		right: 0;
		background: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMyIgaGVpZ2h0PSIxMyIgdmlld0JveD0iMCAwIDEzIDEzIj48cGF0aCBmaWxsPSIjNDI0NzcwIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik03LjI4OCA2LjI5NkwzLjIwMiAyLjIxYS43MS43MSAwIDAgMSAuMDA3LS45OTljLjI4LS4yOC43MjUtLjI4Ljk5OS0uMDA3TDguODAzIDUuOGEuNjk1LjY5NSAwIDAgMSAuMjAyLjQ5Ni42OTUuNjk1IDAgMCAxLS4yMDIuNDk3bC00LjU5NSA0LjU5NWEuNzA0LjcwNCAwIDAgMS0xLS4wMDcuNzEuNzEgMCAwIDEtLjAwNi0uOTk5bDQuMDg2LTQuMDg2eiIvPjwvc3ZnPg==');
		background-repeat: no-repeat;
		background-size: 10px;
		background-position: 50%;
	}
	.ui-datepicker-header a>span {
		display: none;
	}
	.ui-datepicker-title {
		text-align: center;
		line-height: 2rem;
		margin-bottom: 0.25rem;
		font-size: 0.875rem;
		font-weight: 500;
		padding-bottom: 0.25rem;
	}
	.ui-datepicker-week-col {
		color: #78909C;
		font-weight: 400;
		font-size: 0.75rem;
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
		<br><br><br><br><br><br>
			<div class="wrapper">
			<input type="text" id="test_input">
		        <label id="datepicker">날짜를 선택해주세요
		        	<input type="text" id="datepicker_input" autocomplete="off">
		        </label>
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

			
			$( "#datepicker_input" ).datepicker({
				dateFormat: "yy-mm-dd",
				duration: "fast",
			 	nextText: '다음 달',
	        	prevText: '이전 달',
	        	//input text안에 값넣어주는거
	        	altField:"#test_input"
			});
			
		});
		
		
	</script>
	

</body>
</html>


