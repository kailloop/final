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


	<div id="couponListDiv">
		
		<input type="text">
		<button>검색</button>
		
		
		
	</div><!-- couponListDiv닫기 -->


</section>

<script>
	
</script>
	
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>