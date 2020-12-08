<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="" name="title"/>
</jsp:include>
<style>
#content {
	position: relative;
	margin-top: 500px;
}
</style>
		<section id="content">
			<form action="${path }/location/createEnd" method="post" enctype="multipart/form-data">
				<input type="hidden" name="locationCreator" value="${logginedMember.id}">
				<table>
					<tbody>
						<tr><td>제목</td><td><input type="text" name="locationTitle"></td></tr>
						<tr><td>타입</td><td><input type="text" name="locationType"></td></tr>
						<tr><td>지역</td><td><input type="text" name="locationAddress"></td></tr>
						<tr><td>메인 이미지</td><td><input type="file" name="mainFile"></td></tr>
						<tr><td>세부 이미지</td><td><input type="file" name="locationFile"></td></tr>
						<tr><td>전화번호</td><td><input type="text" name="locationPhone"></td></tr>
						<tr><td>내용</td><td><textarea name="locationContent" class="form-control" style="resize: none;"rows="30"></textarea></td></tr>
					</tbody>
				</table>
				<input type="submit">
			</form>
		</section>
		<script>
		</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>