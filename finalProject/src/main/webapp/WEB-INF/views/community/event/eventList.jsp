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

<div id="eventListDiv" style=" margin-top:60px; margin-left:auto; margin-right:auto; width: 1050px; text-align: center;">

	<!--리스트 스타일  -->
		<style>
			.listdiv{
				position: relative;
				margin: 0px;
				margin-left:30px;
				margin-bottom:80px;
				top:30px;
				width:300px;
				float: left;
				height: 300px;
				cursor: pointer;
			}
			.imgclass{
				position: relative;
			}
			.partner{
				position: absolute;
				top:0%;
				background: linear-gradient( to bottom, #27DBB7,#41aea9 );
				padding-right: 5px;
				padding-left: 5px;
				padding-top: 5px;
				padding-bottom: 5px;
				margin-left: 5px;
				font-size: 13px;
				color:white;
			}
			
		</style>
						
		<!--리스트-->
		<c:forEach items="${list }" var="list">
			<div class="listdiv" onclick="location.replace('${path }/eventView?eventNo=<c:out value="${list.eventNo }"/>')">
				<img class="imgclass" alt="" src="${path }/resources/images/home-logo3.jpg" width="298px" height="200px;">
				<p style="position:relative; font-weight:bold; font-size:20px; color:black; text-align: center; height: 15px;">
					<c:out value="${list.eventTitle}" />
				</p>
				<p><c:out value="${list.eventContent }"/></p>
				
			</div>
		</c:forEach>
		
		
		
		<!--div정리용 스타일 (무시)  -->
		<style>
     		div.clearfixed::after{display:block;content:"";clear:both}
		</style>
		<!--div정리용 (무시)  -->
		<div class="clearfixed"></div>
		
		
		
		
		<div id="pageBar">
		</div>
		
		
		
		<div id="btnDiv">
			<!--관리자만 글쓰기할수있게 분기처리  -->
			<button type="button" onclick="location.href='${path }/eventWrite'" class="btn btn-warning">글쓰기</button>
		</div>

	</div><!--eventListDiv닫는곳  -->


</section>

<script>
	/*목록클릭 (view로 가는거)  */
	
</script>
	
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>