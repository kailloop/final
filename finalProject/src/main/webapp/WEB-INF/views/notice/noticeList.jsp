<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="title" />
</jsp:include>
<style>
#content {
	position: relative;
	margin-top: 500px;
}
</style>
<section id="content">
	<div id="tableContainer" class="container">
		<table class="table table-hover">
			<thead class="thead-dark">
				<tr>
					<th>No</th>
					<th>작성자</th>
					<th>제목</th>
					<th>작성일</th>
					<th>조회수</th>
				<tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="l">
					<tr class="jh_tr">
						<td><c:out value="${l.noticeNo }" /></td>
						<td><c:out value="${l.userId }" /></td>
						<td><c:out value="${l.noticeTitle }" /></td>
						<td><c:out value="${l.writeDate }" /></td>
						<td><c:out value="${l.viewCount }" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div id="jh-pageBar">
			<c:out value="${pageBar }" escapeXml="false" />
		</div>
		<button type="button" onclick="noticeWrite()">글쓰기</button>
	</div>
</section>
<script>
	function noticeWrite() {
		location.replace("${path}/notice/write");
	}
	$(function(){
		$(".jh_tr").click(e => {
			var jhval = $(e.target).parent().children().first().html();
			var jhurl = "${path}/notice/noticeView?noticeNo="+jhval; 
			location.href=jhurl;
		})
	});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />