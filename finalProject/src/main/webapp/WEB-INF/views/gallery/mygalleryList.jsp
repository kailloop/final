<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=" " />
</jsp:include>

<link rel="stylesheet" href="${path }/resources/css/animate.css">  
<link rel="stylesheet" href="${path }/resources/css/style.css">

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
		left:33%;
		top:50%;
		font-size:120px;
		z-index:0;
		font-family:Dancing Script;
		color:#D5D5D5;
	}
	#labelTwo{
		position:absolute;
		left:47%;
		top:85%;
		font-size:30px;
		z-index:0;
		cursor:pointer;
		font-family:Roboto;
		color:#A6A6A6;
	}
</style>

<div id="logo">
	<img src="${path }/resources/images/gallery3.jpg" alt="로고1">
	<label id="labelOne">My Gallery</label>
	<label id="labelTwo"><a href="${path }/gallery/galleryList.do" style="color:#A6A6A6;">> Gallery</label>  
</div>

<style>
	*:focus
	{
	    outline: none;
	}
	
	.button-cover, .knobs, .layer
	{
	    position: absolute;
	    top: 1;
	    right: 0;
	    bottom: 0;
	    left: 0;
	}
	
	.button
	{
	    position: relative;
	    top: 50%;
	    width: 74px;
	    height: 36px;
	    margin: -20px auto 0 auto;
	    overflow: hidden;
	}
	
	.button.r, .button.r .layer
	{
	    border-radius: 100px;
	}
	
	
	.checkbox
	{
	    position: relative;
	    width: 100%;
	    height: 100%;
	    padding: 0;
	    margin: 0;
	    opacity: 0;
	    cursor: pointer;
	    z-index: 3;
	}
	
	.knobs
	{
	    z-index: 2;
	}
	
	.layer
	{
	    width: 100%;
	    background-color: #ebf7fc;
	    transition: 0.3s ease all;
	    z-index: 1;
	}
	
	
	
	/* Button 3 */
	#button-3 .knobs:before
	{
	    content: 'YES';
	    position: absolute;
	    top: 4px;
	    left: 4px;
	    width: 20px;
	    height: 10px;
	    color: #fff;
	    font-size: 10px;
	    font-weight: bold;
	    text-align: center;
	    line-height: 1;
	    padding: 9px 4px;
	    background-color: #03A9F4;
	    border-radius: 50%;
	    transition: 0.3s ease all, left 0.3s cubic-bezier(0.18, 0.89, 0.35, 1.15);
	}
	
	#button-3 .checkbox:active + .knobs:before
	{
	    width: 46px;
	    border-radius: 100px;
	}
	
	#button-3 .checkbox:checked:active + .knobs:before
	{
	    margin-left: -26px;
	}
	
	#button-3 .checkbox:checked + .knobs:before
	{
	    content: 'NO';
	    left: 42px;
	    background-color: #F44336;
	}
	
	#button-3 .checkbox:checked ~ .layer
	{
	    background-color: #fcebeb;
	}
</style>

<section class="ftco-section bg-light">
	<div class="container" >
		<div class="row" > 
      		<c:forEach items="${list }" var="g">	
    			<div class="col-md-4 ftco-animate">
      			<div class="blog-entry" >
        			<a href="blog-single.html" class="block-20" style="background-image: url('${path }/resources/images/image_1.jpg');"> <!-- 리네임이미지 --></a>
        		<div class="text px-4 pt-3 pb-4">
	          		<div class="meta">
	            	<%-- <div><a href="#"><c:out value="${g.galleryDate }"/></a></div> --%>
	            		<div><c:out value="${g.galleryDate}"/></div>
	          		</div>
          <%--  <h3 class="heading"><a href="#"><c:out value="${g.galleryTitle }"/></a></h3>  --%>
          		<%-- <h3 class="heading" style="display: inline;" ><c:out value="${g.galleryTitle }"/></h3>
          		<h5 class="heading" style="display: inline; float: right;" ><c:out value="${g.galleryWriter }"/></h5> --%>
          		<h3 class="heading"><c:out value="${g.galleryTitle }"/></h3>
          		<h5 class="heading"><c:out value="${g.galleryWriter }"/></h5>
          <p class="clearfix" >
		            <div class="toggle-button-cover">
		                <div class="button-cover">
		                  <div class="button r" id="button-3">
		                    <input type="checkbox" class="checkbox">
		                    <div class="knobs"></div>
		                    <div class="layer"></div>
		                  </div>
		                </div>
		            </div>
          </p> 
        		</div>
      			</div>
    			</div>
			</c:forEach>
    	</div>
    

    <div id="writeDiv" style="margin-top: 30px; text-align: right;">
    <button type="button" id="write_btn" class="btn btn-danger" onclick="location.href='${path}/gallery/galleryWrite.do'">Write</button>
    </div>
    
    
    <div id="pageBar" style="margin-top: 30px;">
		${pageBar } 
	</div>
    
    
  
	</div>
</section>



<script src="${path }/resources/js/jquery.min.js"></script>
<script src="${path }/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${path }/resources/js/jquery.waypoints.min.js"></script>
<script src="${path }/resources/js/jquery.stellar.min.js"></script>
<script src="${path }/resources/js/owl.carousel.min.js"></script>
<script src="${path }/resources/js/scrollax.min.js"></script>
<script src="${path }/resources/js/main.js"></script>	