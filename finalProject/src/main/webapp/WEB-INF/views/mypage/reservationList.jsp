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

<style>
	#prevatag, .atag, #allatag{
		color:gray;
	}
	#rangediv{
		margin-left: auto;
		margin-right: auto;
	}
</style>

<div style="text-align: center; margin-top: 50px;">
	<p style="font-size: 25px;"><c:out value="${idvalue}"/> 님의 예약내역</p>
	
	<hr>
	<br>
		
	<a id="allatag" style="margin-top: 100px; color:#F26A8D;" href="javascript:alert('전체보기로 설정되어있습니다.');">예약내역</a>
	<a class="atag" href="#">|</a>
	<a id="prevatag" href="#>">지난예약</a>

	
	
	<table border="1" width="800px;" style="margin-top:20px; margin-left: auto; margin-right: auto; ">
		<tr>
			<td>장소이름</td>
			<td>인원</td>
			<td>예약한날짜</td>
			<td>예약된날짜</td>
			<td>예약요일</td>
			<td>예약시간</td>
			<td>결제금액</td>			
		</tr>
		<c:forEach items="${list }" var="r">
		<tr>
			<td>장소이름</td>
			<td> <c:out value="${r.reservationPeopleCount}"/> </td>
			<td><c:out value="${r.paymentDate }"/></td>
			<td><c:out value="${r.reservationDate }"/></td>
			<td><c:out value="${r.reservationDay }"/></td>
			<td><c:out value="${r.reservationTime }"/></td>
			<td><c:out value="${r.reservationPrice }"/></td>
		</tr>
		</c:forEach>
	</table>
</div>


</section>

<jsp:include page='/WEB-INF/views/common/footer.jsp'/>