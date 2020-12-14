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

	<div id="eventViewDiv" style="margin-top: 30px;">
		<table border="1" style="margin-left: auto; margin-right: auto;" width="1000px;">
			<tr>
				<td>인덱스</td>
				<td><c:out value="${e.eventNo}" /></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><c:out value="${e.eventTitle}" /></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><c:out value="${e.eventWriter}" /></td>
				
			</tr>
			<tr>
				<td>내용</td>
				<td><c:out value="${e.eventContent}" /></td>
			</tr>
			<tr>
				<td>이미지자리</td>
			</tr>
		</table>
		
		
	</div>


</section>

<script>
		
</script>
	
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>