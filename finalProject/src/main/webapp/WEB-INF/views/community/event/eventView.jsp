<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="EVENT" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>

<style>
	#eventViewDiv{
		margin-top: 30px;
		margin-left: auto;
		margin-right: auto;
	}
</style>


	<div id="eventViewDiv">
		
		<!--상단 제목  스타일-->
		<style>
			#titleDiv{
				text-align:center;
				font-size:50px;
				font-weight: bold;
				color:black;
				
			}
		</style>
		
		<!--상단 제목  -->
		<div id="titleDiv">
			<p>${event.eventTitle }</p>
			<p style="font-weight: normal; font-size:25px;">${event.eventContent }</p>
		</div>
		
		
		
		<!--리스트 스타일 -->
		<style>
			#listDiv{
				margin-left: auto;
				margin-right: auto;
				margin-top:60px;
			}
		</style>
		
		<!--리스트  -->
		<div id="listDiv" style="width: 1050px;">
			
			<img src="${path }/resources/images/home-logo3.jpg" width="100%" height="600px">
			
		</div>
		
		
		
		<!--쿠폰배너 스타일-->
		<style>
			#couponDiv{
				background: linear-gradient( to right, #FF5050, #FFEB5A);
				height: 70px;
				border-radius: 20px;
				cursor: pointer;
				width:1050px;
				text-align:center;
				margin-left: auto;
				margin-right: auto;
				margin-top: 30px;
			}
		</style>
		
		<!--쿠폰배너  -->
		<div id="couponDiv" onclick="coupon();">
			<p style="font-size: 15px; color: white; padding-top:20px;"><b style="font-size: 17px;"><i class="fas fa-ticket-alt"></i> 쿠폰</b> 다운로드 <i class="fas fa-download"></i></p>
		</div>
		
		
		
		
		
		
		
		
		
		<!--목록,수정,삭제버튼  스타일-->
		<style>
			#btnDiv{
				margin-left: auto;
				margin-right: auto;
				text-align:center;
				margin-top:80px;
			}
		</style>
		<!--목록,수정,삭제버튼  -->
		<div id="btnDiv">
			<button type="button" onclick="location.href='${path }/event/eventList.do'" class="btn btn-warning">목록</button>
		</div>
	</div><!-- eventViewDiv닫기 -->


</section>

<script>
		
</script>
	
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>