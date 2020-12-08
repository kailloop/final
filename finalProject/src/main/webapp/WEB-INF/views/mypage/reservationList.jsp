<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="Reservation" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>

<div style="background: red;">
	<table border="1" width="700px;" style="margin-top:50px; margin-left: auto; margin-right: auto; ">
		<tr>
			<td>장소이름</td>
			<td>인원</td>
			<td>결제금액</td>
			<td>예약한날짜</td>
			<td>예약된날짜</td>
			<td>예약요일</td>
			<td>예약시간</td>			
		</tr>
		<c:forEach items="${list }" var="r">
		<tr>
			<td>안녕</td>
			<td> <c:out value="${r.reservationPeopleCount}"/> </td>
			<td><c:out value="${r.reservationPrice }"/></td>
			<td><c:out value="${r.paymentDate }"/></td>
			<td><c:out value="${r.ReservationDate }"/></td>
			<td><c:out value="${r.reservationDay }"/></td>
			<td><c:out value="${r.reservationTime }"/></td>
		</tr>
		</c:forEach>
		<tr>
			<td>d</td>
		</tr>
	</table>
</div>


</section>

<jsp:include page='/WEB-INF/views/common/footer.jsp'/>