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
	#couponListDiv{
		margin-top: 80px;
		margin-left: auto;
		margin-right: auto;
	}
	
	/*쿠폰번호등록 스타일 */
	#enrollcoupon{
		margin-left: auto;
		margin-right: auto;
		text-align: center;
	}
	
	/*쿠폰리스트 스타일 */
	#listcoupon{
		margin-top:100px; 
		text-align: center;
	}
	#listcoupon table{
		margin-left: auto; 
		margin-right: auto; 
		width:800px;
	}
	th{
		width: 400px;
	}
	.pcoupon{
		font-size: 20px;
		font-weight: bold;
	}
</style>


	<div id="couponListDiv">
		
		<!--쿠폰번호등록  -->
		<div id="enrollcoupon">
			<p class="pcoupon">- 쿠폰번호등록 -</p>
			<input type="text">
			<button type="button" class="btn btn-secondary">등록</button>
		</div>
		
		
		<!--쿠폰리스트  -->
		<div id="listcoupon">
			<p class="pcoupon">- 쿠폰목록 -</p>
				<table border="1">
					<tr>
						<th>쿠폰이름</th>
						<th>쿠폰가격</th>			
					</tr>
					<c:forEach items="${list }" var="coupon">
					<tr>
						<td><c:out value="${coupon.eventTitle}"/> </td>
						<td><c:out value="${coupon.couponPrice}"/></td>
					</tr>
					</c:forEach>
				</table>
		</div>
		
		<div id="pageBar" style="margin-top: 30px;">
        	${pageBar }
        </div>
		
		
	</div><!-- couponListDiv닫기 -->


</section>

<script>
	
</script>
	
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>