<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="FAQ" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>





<div>
<!--상단 제목  -->
<div class="page-header" >
    <p style="font-size: 50px; text-align: center; font-weight: bold;">FAQ</p>
    <div style="background:#FFD9EC; width: 900px; margin-left: auto; margin-right: auto;text-align: center; border-radius: 20px;">
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
    li{
    	cursor: pointer;
    }
</style>


<nav style="margin-left: 160px;">
	<ul id="navul">
    	<li class="navli menuall menuatag" style="color:#F26A8D">ALL</li>
        <li class="navli menulocation menuatag">LOCATION</li>
        <li class="navli menulism menuatag">LISM</li>
        <li class="navli menuanniversary menuatag">ANNIVERSARY</li>
        <li class="navli menuetc menuatag">ETC</li>
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
	  font-weight:bold;
	  color:#DD2D4A;
	  font-size: 38px;
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
<div class="faq-content" style="margin-left: 160px; margin-right: 160px;">

	<div id="faqLocation">
		<div class="faq-question">
	    	<input id="q1" type="checkbox" class="panel">
	    	<div class="plus">+</div>
	    	<label for="q1" class="panel-title">&nbsp;Q. LOCATION 예약내용을 확인하고 싶어요.</label>
	    	<div class="panel-content"><p><em>마이페이지 > 예약내역</em> 에서 확인가능합니다.</p></div>
		</div>
	  
		<div class="faq-question">
	    	<input id="q2" type="checkbox" class="panel">
	    	<div class="plus">+</div>
	    	<label for="q2" class="panel-title">&nbsp; Q. LOCATION 예약을 취소하고 싶어요.</label>
	    	<div class="panel-content"><p><em>마이페이지 > 예약내역 > 예약취소</em> 에서 가능합니다.</div>
	  	</div>
	</div>
	
	<div id="faqLism">
		<div class="faq-question">
	    	<input id="q3" type="checkbox" class="panel">
	    	<div class="plus">+</div>
	    	<label for="q3" class="panel-title">&nbsp; Q. LISM이 무엇인가요? 정해지면바꿔야지</label>
	    	<div class="panel-content"><p>답</p></div>
	  	</div>
	</div>
	
	<div id="faqAnniversary">
	</div>
	
	<div id="faqEtc">  
		<div class="faq-question">
	    	<input id="q4" type="checkbox" class="panel">
	    	<div class="plus">+</div>
	    	<label for="q4" class="panel-title">&nbsp; Q. 회원탈퇴는 어디서 하나요?</label>
	    	<div class="panel-content"><p><em>마이페이지 > 회원정보수정</em> 에서 회원탈퇴가 가능합니다. </p></div>
	  	</div>
	  
	  	<div class="faq-question">
	    	<input id="q5" type="checkbox" class="panel">
	    	<div class="plus">+</div>
	    	<label for="q5" class="panel-title">&nbsp; Q. 쿠폰사용은 어떻게 하나요?</label>
	    	<div class="panel-content"><p><em>마이페이지 > 쿠폰</em> 에서 쿠폰을 등록 후, <em>LOCATION 결제하실 때 쿠폰 사용</em> 을 누르시면 됩니다.</div>
	  	</div>
	  
		<div class="faq-question">
	    	<input id="q6" type="checkbox" class="panel">
	    	<div class="plus">+</div>
	    	<label for="q6" class="panel-title">&nbsp; Q. 아이디가 기억나지 않아요.</label>
	    	<div class="panel-content"><p><em>[아이디 찾기]</em> 를 통해 가입 시 등록한 정보로 조회할 수 있습니다.</p></div>
	  	</div>
	  
	    <div class="faq-question">
	    	<input id="q7" type="checkbox" class="panel">
	    	<div class="plus">+</div>
	    	<label for="q7" class="panel-title">&nbsp; Q. 비밀번호가 기억나지 않아요.</label>
	    	<div class="panel-content"><p><em>[비밀번호 찾기]</em> 를 통해 비밀번호를 재설정 할 수 있습니다.</p></div>
	  	</div>
	</div>

  
</div>




</div>
</section>

<script>
		$(function() {
			$(".menuall").click(function(){
				$("#faqLocation").show();
				$("#faqLism").show();
				$("#faqAnniversary").show();
				$("#faqEtc").show();
				
				$(".menuall").css("color","#F26A8D");
				$(".menulocation").css("color","black");
				$(".menulism").css("color","black");
				$(".menuanniversary").css("color","black");
				$(".menuetc").css("color","black");
			});
			
			$(".menulocation").click(function(){
				$("#faqLocation").show();
				$("#faqLism").hide();
				$("#faqAnniversary").hide();
				$("#faqEtc").hide();
				
				$(".menuall").css("color","black");
				$(".menulocation").css("color","#F26A8D");
				$(".menulism").css("color","black");
				$(".menuanniversary").css("color","black");
				$(".menuetc").css("color","black");
			});
			
			$(".menulism").click(function(){
				$("#faqLocation").hide();
				$("#faqLism").show();
				$("#faqAnniversary").hide();
				$("#faqEtc").hide();
				
				$(".menuall").css("color","black");
				$(".menulocation").css("color","black");
				$(".menulism").css("color","#F26A8D");
				$(".menuanniversary").css("color","black");
				$(".menuetc").css("color","black");
			});
			
			$(".menuanniversary").click(function(){
				$("#faqLocation").hide();
				$("#faqLism").hide();
				$("#faqAnniversary").show();
				$("#faqEtc").hide();
				
				$(".menuall").css("color","black");
				$(".menulocation").css("color","black");
				$(".menulism").css("color","black");
				$(".menuanniversary").css("color","#F26A8D");
				$(".menuetc").css("color","black");
			});
			
			$(".menuetc").click(function(){
				$("#faqLocation").hide();
				$("#faqLism").hide();
				$("#faqAnniversary").hide();
				$("#faqEtc").show();
				
				$(".menuall").css("color","black");
				$(".menulocation").css("color","black");
				$(".menulism").css("color","black");
				$(".menuanniversary").css("color","black");
				$(".menuetc").css("color","#F26A8D");
			});
			
		});
		
	</script>