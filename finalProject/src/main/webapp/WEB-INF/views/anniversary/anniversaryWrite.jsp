<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="ANNIVERSARY" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>

<style>
	#anniversaryWrite{
		margin-top: 100px;
		margin-left: auto;
		margin-right: auto;
	}
</style>

	<div id="anniversaryWrite">
		
		<!--사업장목록보여주는 리스트  스타일-->
		<style>
			#listTable{
				width: 800px;
				margin-left: auto;
				margin-right: auto;
				text-align: center;
				margin-top: 30px;
			}
			td{
				cursor: pointer;
			}
		</style>
		<!--사업장 등록이 되어있을경우 -->
		<c:if test="${!empty locationList}">
			<!--사업장목록보여주는 리스트  -->
			<div id="locationList">
				<div id="listTable">
					<p style="font-size: 25px; color: black; height: 30px;">내 사업장 목록 </p>
					<p>원하시는 사업장을 선택해주세요</p>
					<table id="listTable" class="table table-hover">
			            <tr class="active" style="border-bottom: 1px;">
			                <th>[로케이션]제목</th>
			            	<th>[로케이션]지역</th>
			                <th>[로케이션]타입</th>
			            </tr>
		            	<c:forEach var="location" items="${locationList }">
		            	<tr onclick="location.replace('${path }/anniWriteDetail?locationNo=<c:out value="${location.locationNo }"/>')">
		            		<td><c:out value="${location.locationTitle }"/></td>
		            		<td><c:out value="${location.locationAddress }"/></td>
		            		
		            			<c:if test="${location.locationType eq 's'}">	
									<td>숙박전체</td>
								</c:if>
								<c:if test="${location.locationType eq 's1'}">	
									<td>호텔</td>
								</c:if>
								<c:if test="${location.locationType eq 's2'}">	
									<td>펜션</td>
								</c:if>
								<c:if test="${location.locationType eq 's3'}">	
									<td>글램핑/캠핑</td>
								</c:if>
								<c:if test="${location.locationType eq 's4'}">	
									<td>게스트하우스</td>
								</c:if>
								<c:if test="${location.locationType eq 'l'}">	
									<td>명소전체</td>
								</c:if>
								<c:if test="${location.locationType eq 'l1'}">	
									<td>랜드마크</td>
								</c:if>
								<c:if test="${location.locationType eq 'l2'}">	
									<td>자연/공원</td>
								</c:if>
								<c:if test="${location.locationType eq 'l3'}">	
									<td>놀이동산</td>
								</c:if>
								<c:if test="${location.locationType eq 'l4'}">	
									<td>워터파크</td>
								</c:if>
								<c:if test="${location.locationType eq 'f'}">	
									<td>음식전체</td>
								</c:if>
								<c:if test="${location.locationType eq 'f1'}">	
									<td>식당</td>
								</c:if>
								<c:if test="${location.locationType eq 'f2'}">	
									<td>카페</td>
								</c:if>
								<c:if test="${location.locationType eq 'a'}">	
									<td>액티비티전체</td>
								</c:if>
								<c:if test="${location.locationType eq 'a1'}">	
									<td>스키/썰매</td>
								</c:if>
								<c:if test="${location.locationType eq 'a2'}">	
									<td>낚시</td>
								</c:if>
								<c:if test="${location.locationType eq 'a3'}">	
									<td>수상레저</td>
								</c:if>
								<c:if test="${location.locationType eq 'a4'}">	
									<td>바이크</td>
								</c:if>
								<c:if test="${location.locationType eq 'sh'}">	
									<td>가게전체</td>
								</c:if>
								<c:if test="${location.locationType eq 'sh1'}">	
									<td>특산품가게</td>
								</c:if>
								<c:if test="${location.locationType eq 'sh2'}">	
									<td>기념품가게</td>
								</c:if>
								<c:if test="${location.locationType eq 'sh3'}">	
									<td>의류가게</td>
								</c:if>
								<c:if test="${location.locationType eq 'sh4'}">	
									<td>스포츠가게</td>
								</c:if>
		            		
		            	</tr>
		            	</c:forEach>
		       		</table> 
				</div>
				
				<div id="pageBar">
		        	${pageBar }
		        </div>
			</div><!--locationList닫기  -->
	    </c:if>   
		
		<!--사업장 등록 안되어있을경우 --> 
		<c:if test="${empty locationList}">
			<div id="notEnroll" style="text-align: center;">
				<p style="font-size: 30px; margin-top: 70px;">등록된 사업장이 없습니다. 사업장 등록을 먼저 해주세요.</p>
				<button type="button" class="btn btn-secondary" onclick="">사업장 등록하러가기</button>
			</div>
		</c:if>
		
		
		
	</div><!-- anniversaryWrite닫기 -->


</section>

<script>
	

</script>
	
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>