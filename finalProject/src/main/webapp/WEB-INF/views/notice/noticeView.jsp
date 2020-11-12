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
#logo {
	height: 900px;
	width: 100%;
	position: relative;
	z-index: 0;
	overflow: hidden;
}

#logo img {
	filter: grayscale(65%);
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
	width: 100%;
	height: 100%;
	z-index: -1;
}

#logo label {
	position: absolute;
	left: 27%;
	top: 35%;
	font-size: 120px;
	z-index: 0;
	cursor: pointer;
	font-family: Dancing Script;
	color: black;
}
</style>
<div id="logo">
	<img src="${path }/resources/images/notice.jpg" alt="notice" /> <label>Notice</label>
</div>
<section id="content" class="container" style="height: 500px;">
	<h1>
		<c:out value="${notice.userId}" />
		<c:out value="${notice.noticeTitle}" />
		<c:out value="${notice.writeDate}" />
		<c:out value="${notice.viewCount}" />
	</h1>
	<hr>
	<br>
	<div>
	<p class="float-left"><c:out value="${notice.userId}" /></p>
	<p class="float-right"><c:out value="${notice.writeDate}" /></p>
	</div>
	<br>
	<hr>
	<c:forEach var="file" items="${noticeFile}">
		<c:out value="${file.renameName }" />
		<a href="${path }/notice/fileDownload?fileName=${file.renameName}">다운로드</a>
		<br>
		<hr>
	</c:forEach>
	<br>
		<textarea rows="30" class="form-control" style="resize: none;" disabled readonly><c:out value="${notice.noticeTitle }"/></textarea>
	<br>
	<c:if test="${noticeComment != null}">
		<div id="allCommentDiv">
				<c:forEach var="comment" items="${noticeComment}">
					<c:if test="${comment.replyPosition eq 0}">
						<c:if test="${noticeComment[0].commentPosition eq comment.commentPosition }">
							<div id="commentDiv">
						</c:if>
						<c:if test="${noticeComment[0].commentPosition ne comment.commentPosition }">
							</div>
							<div id="commentDiv">
						</c:if>
						<hr>
						<div id="inCommentDiv">
							<c:out value="${comment.userId }" />
							<c:out value="${comment.commentContent }" />
							<c:out value="${comment.commentPosition }" />
							<c:out value="${comment.replyPosition }" />
							<c:out value="${comment.writeDate }" />
						</div>
					</c:if>
					<c:if test="${comment.replyPosition ne 0}">
						<div id="replyDiv">
							<c:out value="${comment.userId }" />
							<c:out value="${comment.commentContent }" />
							<c:out value="${comment.commentPosition }" />
							<c:out value="${comment.replyPosition }" />
							<c:out value="${comment.writeDate }" />
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
		<hr>
	</c:if>
	<form id="formAddComment" action="${path }/notice/addComment">
		<div class="row">
			<textarea id="textaread" name="comment" class="form-control"
				style="width: 89%; resize: none; margin-left: 15px;" rows="4"></textarea>
			<button onclick="addComment();" style="margin-left: 5px;"
				type="button" class="col-sm-1 btn btn-outline-secondary float-right">댓글작성</button>
		</div>
	</form>
</section>
<script>
	function addComment() {
		$("#formAddComment").submit();
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />