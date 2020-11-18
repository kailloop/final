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
		
		<div id="day_search">
		<br><br>
		</div>
</section>	
	
	
	<script>
		$(function() {
			$(".search").click(function(){
				$(".search").css("color","#F26A8D");
				$(".day").css("color","lightgray");
				$(".menu_select").css("left","55%");
				$("#name_search").show();
				$("#day_search").hide();
			});
			
			$(".day").click(function() {
				$(".search").css("color","lightgray");
				$(".day").css("color","#F26A8D");
				$(".menu_select").css("left","21%");
				$("#name_search").hide();
				$("#day_search").show();
			});
			
			
		});
		
	</script>
	

</body>
</html>


