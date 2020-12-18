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
		height:1200px;
		text-align:center;
	}
	#page-title{
		position:relative;
		margin-right:auto;
		margin-left:auto;
		font-family: 'Dancing Script', cursive;
		font-size:102px;
		color:black;
	}
	#lism-title{
		position:relative;
		margin-left:auto;
		margin-right:auto;
		top:-10px;
		width:50%;
		height:60px;
		border:none;
		border:none;
		text-align:center;
	}
	.lism-input{
		position:relative;
		outline:none;
		width:100%;
		height:100%;
		border:none;
		border-bottom:3px gray solid;
		transition:0.5s;
		font-size:36px;
		background-color:transparent;
	}
	.lism-name{
		position:relative;
		font-family: 'Hi Melody', cursive;
		font-size:42px;
		left:25%;
		top:30px;
		height:50px;
		color:black;
		transition:0.7s;
	}
	#focus-one{
		position:relative;
		width:40%;
		height:500px;
		border:2px black solid;
	}
	#focus-two{
		position:relative;
		width:40%;
		height:500px;
		left:60%;
		top:-500px;
		border:2px black solid;
	}
	.focus{
		transition:0.5s;
	}
	.handle{
		position:relative;
		width:50%;
		top:14%;
		height:350px;
		margin-left:auto;
		margin-right:auto;
		border:1px red solid;
	}
</style>
	<label id="page-title">Couplism</label>
	<form action="/lism/createEnd" method="post" style="text-align:left;">
		<label class="lism-name">제목</label>
		<div id="lism-title">
			<input class="lism-input" maxlength="30" name="title" id="title" type="text" autocomplete="off">
		</div>
		<br/>
		<div id="focus-one" class="focus">
			
		</div>
		<div id="focus-two" class="focus">
			<div class="handle">
			</div>
		</div>
	</form>
	<script>
		$(".lism-input").focus(function(e){
			$(e.target).css("border-bottom","3px #F26A8D solid");
		});
		$(".lism-input").blur(function(e){
			$(e.target).css("border-bottom","3px gray solid");
		});
		
		
		$("#lism-title").children('input').focus(function(e){
			$(".lism-name").css("top","20px");
			$(".lism-name").css("font-size","16px");
			$(".lism-name").css("color","#F26A8D");
		});
		$("#lism-title").children('input').blur(function(e){
			var title=$("#title").val();
			$(e.target).css("border-bottom","3px #F26A8D solid");
			if(title==""){
				$(".lism-name").css("top","30px");
				$(".lism-name").css("font-size","42px");
				$(".lism-name").css("color","black");
				$(e.target).css("border-bottom","3px black solid");
				return;
			}
		});
	</script>
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>