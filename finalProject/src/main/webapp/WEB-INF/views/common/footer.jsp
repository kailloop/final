<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
</section>
<style>
	footer{
		width:100%;
		height:400px;
		position:relative;
		bottom:0;
		margin:0;
		padding:0;
		background-color:#3E4550;
	}
	#footer-container{
		width:60%;
		margin:0;
		padding:0;
		margin-left:auto;
		margin-right:auto;
		position:relative;
		height:80%;
		top:35px;
		text-align:center;
	}
	#footer-first {
		width:25%;
		min-width:230px;
		position:relative;
		height:100%;
		float:left;
		text-align:left;
	}
	#footer-second{
		width:25%;
		position:relative;
		height:100%;
		margin-left:80px;
		float:left;
		text-align:left;
	}
	#footer-third{
		width:25%;
		position:relative;
		height:100%;
		margin-left:-40px;
		float:left;
		text-align:left;
	}
	#footer-fourd{
		width:25%;
		position:relative;
		height:100%;
		top:-320px;
		left:84%;
		text-align:left;
		
	}
	.footer-title{
		color:white;
		font-size:18px;
		font-family: 'Montserrat', sans-serif;
		font-weight:bolder;
		text-align:left;
	}
	.footer-content{
		color:white;
		font-size:14px;
		font-family:Nanum Gothic Coding;
		font-weight:bolder;
		text-align:left;
	}
	#footer-border{
		border-bottom:3px gray solid;
		position:relative;
		height:1px;
		width:110%;
		top:-50px;
	}
	.footer-last{
		position:relative;
		color:gray;
		font-size:16px;
		font-family: 'Montserrat', sans-serif;
		top:-30px;
	}
</style>
<footer>
	<div id="footer-container">
		<div id="footer-first">
			<label class="footer-title">COMPANY COUPLISM</label>
			<br/>
			<label class="footer-content">
			커플리즘 회사는 커플들의 계획을 편하고 쉽게 짤 수 있도록 도와주는 사이트 운영팀입니다.
			운영팀은 강범석, 이재형, 임지현으로 총 3명으로 운영 되고 있습니다.
			회사에 대해 더욱 알아보고 싶으신분은 회사소개란을 참조해주세요. 감사합니다.
			</label>
		</div>
		<div id="footer-second">
			<label class="footer-title">EVENTS</label>
			<br/>
			<label class="footer-content" style="cursor:pointer;">
				쿠폰 이벤트
			</label>
			<br/>
			<label class="footer-content" style="cursor:pointer;">
				숙소 이벤트
			</label>
		</div>
		<div id="footer-third">
			<label class="footer-title">DEVELOPERS TEAM</label>
			<br/>
			<label class="footer-content">대표자 : 임지현</label>
			<br/>
			<label class="footer-content">공동 책임자 : 이재형</label>
			<br/>
			<label class="footer-content">공동 책임자 : 강범석</label>
			<br/>
		</div>
		<div id="footer-fourd">
			<label class="footer-title">CONTACTS</label>
			<br/>
			<label class="footer-content"><i class="fas fa-home"></i> 서울특별시 강남구 테헤란로14길 6 남도빌딩</label>
			<br/>
			<label class="footer-content"><i class="fas fa-envelope-open-text"></i> couplism@naver.com</label>
			<br/>
			<label class="footer-content"><i class="fas fa-phone"></i> 010-8902-0975</label>
			<br/>
			<label class="footer-content"><i class="fas fa-blender-phone"></i> 02-8282-5959</label>
		</div>
		<div id="footer-border">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</div>
		<label class="footer-last">© Copyright 2020. Couplism All Pictures Cannot Be Copied Wihour Permission.</label>
	</div>
</footer>

</body>
</html>