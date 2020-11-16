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
	#container{
		text-align: center;
	}
	#search_input{
		width:450px;
		outline-style: none;
	}
	#search_div{
		background:#FCFCFC; 
		width:1000px; 
		height:160px; 
		margin-left: auto; 
		margin-right: auto;
		text-align: center;
		vertical-align: middle;
		margin-top: 50px;
		border-radius: 10px;
	}
	
	#search_btn{
		width: 100px;	
	}
</style>

    
</div>
	<div id="container">
		<br>
		<h3>ANNIVERSARY</h3>
		<div id="search_div">
		<br><br>
			<input type="text" id="search_input">
			<button type="button" id="search_btn" class="btn btn-outline-danger">Search</button>
		</div>
	</div>
</section>
</body>
</html>


