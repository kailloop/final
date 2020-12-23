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
	#anniversaryWriteDetail{
		margin-top: 100px;
		margin-left: auto;
		margin-right: auto;
		text-align: center;
	}
	#viewTable{
		width: 800px;
		margin-left: auto;
		margin-right: auto;
		margin-top:40px;
	}
</style>

	<div id="anniversaryWriteDetail">
		<button type="button" class="btn btn-secondary" onclick="location.href='${path }/anniWrite?userId=${logginedMember.id }'">로케이션 다시 선택하기</button>
		<table id="viewTable" border="1">
			<tr>
				<td>[로케이션]제목</td>
				<td>${location.locationTitle }</td>
			</tr>
			<tr>
				<td>[로케이션]지역</td>
				<td>${location.locationAddress }</td>
			</tr>
			<tr>
				<td>[로케이션]타입</td>
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
		
			<tr>
				<td colspan="2">
					<select name="type" required>
						<option value="op1">기념일을 선택해주세요</option>
						<option value="op2">발렌타인데이</option>
						<option value="op3">화이트데이</option>
						<option value="op4">로즈데이</option>
						<option value="op5">실버데이</option>
						<option value="op6">포토데이</option>
						<option value="op7">와인데이</option>
						<option value="op8">무비데이</option>
						<option value="op9">허그데이</option>
						<option value="op10">와인데이</option>
						<option value="op11">와인데이</option>
						<option value="op12">크리스마스</option>
						<option value="op13">할로윈</option>
					</select>
					<input type="text" placeholder="가격을 적어주세요">
					<button type="button" class="btn btn-outline-secondary">선택</button>
			</tr>
		</table> 
		
		
		
		
	</div><!-- anniversaryWriteDetail닫기 -->


</section>

<script>
	

</script>
	
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>