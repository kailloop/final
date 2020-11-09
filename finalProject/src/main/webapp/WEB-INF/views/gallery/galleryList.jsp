<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="갤러리" />
</jsp:include>

<link rel="stylesheet" href="${path }/resources/css/animate.css">  
<link rel="stylesheet" href="${path }/resources/css/style.css">

<link rel="stylesheet" href="${path }/resources/css/main.css" />

<style>
	#logo{
		height:600px;
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
	#labelOne{
		position:absolute;
		left:40%;
		top:50%;
		font-size:120px;
		z-index:0;
		cursor:Default;
		font-family:Dancing Script;
		color:#D5D5D5;
	}
	#labelTwo{
		position:absolute;
		left:45%;
		top:85%;
		font-size:30px;
		z-index:0;
		cursor:pointer;
		font-family:Roboto;
		color:#A6A6A6;
	}
	#labelTwo a:hover {
        color:red;
	}
</style>

<div id="logo">
	<img src="${path }/resources/images/gallery/gallery3.jpg" alt="로고1">
	<label id="labelOne">Gallery</label>
	<%-- <label id="labelTwo"> <a href="${path }/gallery/mygalleryList.do" style="color:#A6A6A6;">> My Gallery</a>  </label> --%>
	
</div>

<section class="container" id="main">
	<section class="thumbnails">
		<c:forEach items="${list }" var="g">
			<div>
				<a href="">
				<img src="${path }/resources/images/gallery/gallery3.jpg" alt="" />
				<h3><c:out value="${g.galleryTitle }"/></h3>
				</a>
			</div>
		</c:forEach>			
	</section>
 <div id="writeDiv" style="margin-top: 30px; text-align: right;">
    <button type="button" id="write_btn" class="btn btn-danger" onclick="location.href='${path}/gallery/galleryWrite.do'">Write</button>
    </div>
    
    
    <div id="pageBar" style="margin-top: 30px;">
		${pageBar } 
	</div>
</section>



<script src="${path }/resources/js/jquery.min.js"></script>
<script src="${path }/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${path }/resources/js/jquery.waypoints.min.js"></script>
<script src="${path }/resources/js/jquery.stellar.min.js"></script>
<script src="${path }/resources/js/owl.carousel.min.js"></script>
<script src="${path }/resources/js/scrollax.min.js"></script>
<script src="${path }/resources/js/main.js"></script>	
