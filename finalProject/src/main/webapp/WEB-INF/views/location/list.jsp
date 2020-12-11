<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>
			<div id="locationListDiv">
				<c:forEach items="${locationList }" var="lL">
					
				</c:forEach>
			</div>
			<nav aria-label="Page navigation example" style="margin-bottom: 20px;">
                <ul id="pageNavUl" class="pagination justify-content-center">
                    <c:out value="${pageBar }" escapeXml="false" />
                </ul>
            </nav>
		</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>