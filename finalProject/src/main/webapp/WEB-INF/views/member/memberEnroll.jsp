<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<c:set var="path" value="${pageContext.request.contextPath }"/>
<style>
	#type-select{
		width:70%;
		height:200px;
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
	.enrollUser{
		position:relative;
		margin-left:auto;
		margin-right:auto;
		cursor:pointer;
		color:black;
		border:1px blue solid;
		width:200px;
		max-width:200px;
	}
	.enrollPartner{
		position:relative;
		margin-left:auto;
		margin-right:auto;
		cursor:pointer;
		border:1px red solid;
		width:200px;
		max-width:200px;
	}
	td > label{
		cursor:pointer;
	}
</style>
		<div id="type-select">
			<table style="width:100%;">
				<tr style="text-align:center; cursor:pointer;">
					<td class="enrollUser" style="width:47.5%;">
						<label>User / </label><label style="font-size:47.5%;">&nbsp;일반 회원</label>
					</td>
					<td style="width:5%;">
						<label>ㅣ</label>
					</td>
					<td class="enrollPartner" style="width:47.5%;">
						<label>Partner / </label><label style="font-size:47.5%;">&nbsp; 제휴 회원</label>
					</td>
				</tr>
			</table>
		</div>
		
		
	
	</section>
	<script>
	$(function(){
		$(".enrollPartner").click(function(){
			$(".enrollPartner").css("color","#F26A8D");
			$(".enrollUser").css("color","lightgray");
			$(".enrollPartner").animate({
				borderLeftWidth : '100%'
			},1000);
		});
		$(".enrollUser").click(function(){
			$(".enrollPartner").css("color","lightgray");
			$(".enrollUser").css("color","#F26A8D");
		});	
	});
	
	</script>
	<footer>
		
	</footer>
	
	
</body>
</html>