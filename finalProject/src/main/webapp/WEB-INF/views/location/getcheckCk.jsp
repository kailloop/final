<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>
<script type="text/javascript" src="${path }/resources/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="${path }/resources/ckeditor/contents.css">
			<div>${content}</div>
		</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>