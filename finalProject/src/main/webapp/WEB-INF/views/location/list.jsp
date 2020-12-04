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
	#logo{
		height:900px;
		width:100%;
		
	    position: relative;
	    z-index: 0;
	    overflow: hidden;
	}
	#logo img{
		filter: grayscale(65%);
		background-size: cover;
	    background-repeat: no-repeat;
	    background-position: center center;
		width:100%;
		height:100%;
		z-index:-1;
	}
	#logo label{
		position:absolute;
		left:27%;
		top:35%;
		font-size:120px;
		z-index:0;
		cursor:pointer;
		font-family:Dancing Script;
		color:black;
	}
</style>
	<div id="logo">
		<img src="${path }/resources/images/notice.jpg" alt="notice"/>
		<label>Notice</label> 
	</div>
		<section id="content">
			<table>
				<c:forEach items="${locationList }" var="l">
					<tr class="jh_tr">
						<td><c:out value="${l.locationNo }" /></td>
						<td><c:out value="${l.locationType }" /></td>
						<td><c:out value="${l.locationTitle }" /></td>
						<td><c:out value="${l.locationCreator }" /></td>
						<td><c:out value="${l.locationContent }" /></td>
						<td><c:out value="${l.locationPhone }" /></td>
						<td><c:out value="${l.locationAddress }" /></td>
						<td><c:out value="${l.locationStatus }" /></td>
					</tr>
				</c:forEach>
			</table>
			<nav aria-label="Page navigation example" style="margin-bottom: 20px;">
                <ul id="pageNavUl" class="pagination justify-content-center">
                    <c:out value="${pageBar }" escapeXml="false" />
                </ul>
            </nav>
		</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>