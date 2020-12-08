<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="" name="title"/>
</jsp:include>
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
		<img src="${path }/resources/images/notice.jpg" alt="notice"/>
		<label>Notice</label> 
	</div>
		<section id="content">
			<form action="${path }/location">
				<input name="locationAddress" type="text">
				<input name="locationType" type="text">
				<input name="keyword" type="text">
				<input type="submit" value="전송"/>
			</form>
		</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>