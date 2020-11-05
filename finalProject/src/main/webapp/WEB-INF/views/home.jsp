<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&display=swap" rel="stylesheet">
<c:set var="path" value="${pageContext.request.contextPath }"/>
<style>
	#logo{
		height:900px;
		width:100%;
		
	    position: relative;
	    z-index: 0;
	    overflow: hidden;
	}
	#logo img{
		filter: grayscale(65%);
		background-size: cover;
	    background-repeat: no-repeat;
	    background-position: center center;
		width:100%;
		height:100%;
		z-index:-1;
	}
	#logo label{
		position:absolute;
		left:27%;
		top:35%;
		font-size:120px;
		z-index:0;
		cursor:pointer;
		font-family:Dancing Script;
		color:black;
	}
	
</style>
	<div id="logo">
		<img src="${path }/resources/images/logo3.jpg" alt="로고1">
		<label>Couplism Main Event</label> 
	</div>
	
	
	
</body>
</html>
