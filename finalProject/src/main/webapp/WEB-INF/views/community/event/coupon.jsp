<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="${path }/resources/css/style.css">


<style>
	#couponDiv{
		margin-top: 40px;
		margin-left: auto;
		margin-right: auto;
	}
</style>

	<div id="couponDiv">
		
		<style>
			#couponTb{
				margin-left: auto;
				margin-right: auto;
				text-align: center;
				font-size:30px;
				border-spacing: 20px 50px;
			}
		</style>
		
		<table id="couponTb" >
			<tr>
				<td>쿠폰이 발급되었습니다. <br>쿠폰함으로 가시겠습니까?</td>
			</tr>
			<tr>
				<td>
					<button type="button" class="btn btn-info" onclick="downBtn();">확인</button>
					<button type="button" class="btn btn-outline-danger" onclick="javascript:window.close()">취소</button>
				</td>				
			</tr>
		</table>
				
		
		
	</div><!-- couponDiv닫기 -->


</section>

<script>
	function downBtn(){
		javascript:window.close();
		window.opener.location.href='${path}/conponList?idvalue=<c:out value="${logginedMember.id }"/>';
	}
</script>