<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&display=swap" rel="stylesheet">
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>
<style>
	section{
		height:800px;
	}
	#first-div{
		margin:0;
		margin-left:auto;
		margin-right:auto;
		width:80%;
		height:100%;
		border:1px red solid;
	}
	#first-q{
		position:relative;
		width:60%;
		height:50%;
		border:1px lightgray solid;
		border-radius:30px;
		box-shadow:3px 5px 5px gray;
	}
	#first-q > img{
		width:50%;
		height:100%;
		border-radius:30px;
	}
	#first-q-label-one{
		color:black;
		position:relative;
		top:-40%;
		left:10%;
		font-size:32px;
		font-family:Nanum Gothic Coding;
	}
	#first-q-div{
		position:relative;
		width:50%;
		height:100%;
		left:50%;
		top:-100%;
		border-radius:30px;
	}
	#first-q-div > table{
		width:100%;
		height:auto;
	}
	.q-title{
		color:black;
		font-size:24px;
		font-family: 'Montserrat', sans-serif;
		height:40px;
	}
	.q-value{
		height:50px;
		width:90%;
		border:none;
		outline:none;
		border:1px lightgray solid;
		transition:1s;
	}
</style>
	<div id="first-div">
		<div id="first-q">
			<img src="${path }/resources/images/forgot-ID.jpg">
			<label id="first-q-label-one">아이디 찾기</label>
			<div id="first-q-div">
			<br/><br/>
			<table>
				<tr>
					<td><label class="q-title">별명 / 닉네임</label></td>
				</tr>
				<tr>
					<td><input type="text" class="q-value" placeholder="귀하의 별명을 입력해주세요"></td>
				</tr>
				<tr>
					<td><label class="q-title"></label></td>
				</tr>
			</table>
				
			</div>
			
		</div>
	</div>
<script>
	$(function(){
		$(".q-value").focus(function(){
			$(".q-value").css("border","1px #F26A8D solid");
		});
		$(".q-value").blur(function(){
			$(".q-value").css("border","1px lightgray solid");
		});
	});
</script>
	
	
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>