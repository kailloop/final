<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="FAQ" />
</jsp:include>
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
	<img src="${path }/resources/images/home-logo.jpg" alt="로고1">
	<!-- <label id="labelOne">FAQ</label> -->
	<%-- <label id="labelTwo"> <a href="${path }/gallery/mygalleryList.do" style="color:#A6A6A6;">> My Gallery</a>  </label> --%>
	
</div>



<section class="container" style="background: white; position:relative; margin-top: -90px; z-index:0; width: 5000px;">
<div>
<!--상단 제목  -->
<div class="page-header" >
    <p style="font-size: 50px; text-align: center; font-weight: bold;">FAQ</p>
    <div style="background:#FFD9EC; width: 900px; margin-left: auto; margin-right: auto;text-align: center; border-radius: 20px; ">
    <strong style="color:#DD2D4A;  font-size: 18px; ">"FAQ를 통해서 원하시는 답변을 쉽고 빠르게 찾아보세요"</strong>
    <p style="color:#DD2D4A;  font-size: 15px; text-align: center; ">질문 빈도수가 높은 질문들을 모아, 친절한 답변과 함께 재공해드리고 있습니다.</p>
    
    </div>
    
    
</div>

<style>
	.menuatag{
		text-decoration:none; color:#000000;
	}         
    .menuatag:hover{
    	color:#f26A8D;
    }                    
    #navul{ 
    	padding-top:10px;
    	margin-top: 30px;
    }
    .navli{
        display:inline;                       
        border-left:1px solid #999;      
        font-size:13px;
        font-weight:bold;            
        padding:0 10px;
    }
    .navli:first-child{border-left:none;}
    .menuatagcolor{
    	color:#f26a8d;
    } 
</style>

<!-- 
<div>
	<ul>
       <li><a href="#">ALL</a></li>
       <li><a href="#">LOCATION</a></li>
       <li><a href="#">LISM</a></li>
       <li><a href="#">ANNIVERSARY</a></li>
       <li><a href="#">ETC</a></li>      
	</ul>
</div> -->

<nav>
        <ul id="navul">
            <li class="navli"><a href="${path }/faq/faqList.do" class="menuatag">ALL</a></li>
            <li class="navli"><a href="${path }/faq/faqLocation.do" class="menuatag">LOCATION</a></li>
            <li class="navli"><a href="${path }/faq/faqLism.do" class="menuatag menuatagcolor">LISM</a></li>
            <li class="navli"><a href="${path }/faq/faqAnniversary.do" class="menuatag">ANNIVERSARY</a></li>
            <li class="navli"><a href="${path }/faq/faqEtc.do" class="menuatag">ETC</a></li>
        </ul>   
    </nav>   



<style>
    

	body {
	  color: #333;
	  background: #fcfcfc;
	  font-family: 'Raleway', sans-serif;
	  overflow-x: hidden;
	}
	
	.faq-content {
	  margin: 40px auto;
	}
	
	.faq-question {
	  padding: 20px 0;
	  border-bottom: 1px dotted #ccc;
	}
	
	.panel-title {
	  font-size: 20px;
	  width: 100%;
	  position: relative;
	  margin: 0;
	  padding: 10px 10px 0 48px;
	  display: block;
	  cursor: pointer;
	}
	
	.panel-content {
	  font-size: 16px;
	  padding: 0px 14px;
	  margin: 0 40px;
	  height: 0;
	  overflow: hidden;
	  z-index: -1;
	  position: relative;
	  opacity: 0;
	  -webkit-transition: .4s ease;
	  -moz-transition: .4s ease;
	  -o-transition: .4s ease;
	  transition: .4s ease;
	}
	
	.panel:checked ~ .panel-content{
	  height: auto;
	  opacity: 1;
	  padding: 14px;
	}
	
	.plus {
	  position: absolute;
	  margin-left: 20px;
	  margin-top: 9px;
	  z-index: 5;
	  font-size: 42px;
	  line-height: 100%;
	  -webkit-user-select: none;    
	  -moz-user-select: none;
	  -ms-user-select: none;
	  -o-user-select: none;
	  user-select: none;
	  -webkit-transition: .2s ease;
	  -moz-transition: .2s ease;
	  -o-transition: .2s ease;
	  transition: .2s ease;
	}
	
	.panel:checked ~ .plus {
	  -webkit-transform: rotate(45deg);
	  -moz-transform: rotate(45deg);
	  -o-transform: rotate(45deg);
	  transform: rotate(45deg);
	}
	
	.panel {
	  display: none;
	}
	p>em{
		color:#DD2D4A;
	}
</style>

<!--faq내용들  -->
<div class="faq-content">
  
  <div class="faq-question">
    <input id="q3" type="checkbox" class="panel">
    <div class="plus">+</div>
    <label for="q3" class="panel-title">Q. LISM이 무엇인가요? 정해지면바꿔야지</label>
    <div class="panel-content"><p>답</p></div>
  </div>
  
  
</div>




</div>
</section>