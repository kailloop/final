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


	<div id="eventViewDiv">
		
		<!--상단 제목  스타일-->
		<style>
			#titleDiv{
				text-align:center;
				font-size:50px;
				font-weight: bold;
				color:black;
				
			}
		</style>
		
		<!--상단 제목  -->
		<div id="titleDiv">
			<p>${event.eventTitle }</p>
			<p style="font-weight: normal; font-size:25px;">${event.eventContent }</p>
		</div>
		
		
		
		<!--리스트 스타일 -->
		<style>
			#listDiv{
				margin-left: auto;
				margin-right: auto;
				margin-top:60px;
			}
		</style>
		
		<!--리스트  -->
		<div id="listDiv" style="width: 1050px;">
			
			<img src="${path }/resources/upload/event/${event.eventRenamedFilename}" width="100%" height="600px">
			
		</div>
		
		
		
		<!--쿠폰배너 스타일-->
		<style>
			#couponDiv{
				background: linear-gradient( to right, #FF5050, #FFEB5A);
				height: 70px;
				border-radius: 20px;
				cursor: pointer;
				width:1050px;
				text-align:center;
				margin-left: auto;
				margin-right: auto;
				margin-top: 30px;
			}
			#notcouponDiv{
				background: linear-gradient( to right, #FF5050, #FFEB5A);
				height: 70px;
				border-radius: 20px;
				cursor: pointer;
				width:1050px;
				text-align:center;
				margin-left: auto;
				margin-right: auto;
				margin-top: 30px;
			}
			#snscouponDiv{
				background: linear-gradient( to right, #FF5050, #FFEB5A);
				height: 70px;
				border-radius: 20px;
				cursor: pointer;
				width:1050px;
				text-align:center;
				margin-left: auto;
				margin-right: auto;
				margin-top: 30px;
			}
		</style>
		
		<!--네이버,카카오회원 쿠폰배너  -->
		<c:if test="${logginedMember==null}">
			<c:if test="${naverLogin.email!=null }">
				<c:if test="${kakaoLogin.email!=null }">
					<div id="snscouponDiv">
						<p style="font-size: 15px; color: white; padding-top:20px;"><b style="font-size: 17px;"><i class="fas fa-ticket-alt"></i> 쿠폰</b> 다운로드 <i class="fas fa-download"></i></p>
					</div>
				</c:if>
			</c:if>
		</c:if>
		<!--로그인한 사람들 쿠폰배너  -->
		<c:if test="${logginedMember!=null}">
			<div id="couponDiv">
				<p style="font-size: 15px; color: white; padding-top:20px;"><b style="font-size: 17px;"><i class="fas fa-ticket-alt"></i> 쿠폰</b> 다운로드 <i class="fas fa-download"></i></p>
			</div>
		</c:if>
		<!--로그인안한 사람들 쿠폰배너  -->	
		<c:if test="${logginedMember==null}">
			<c:if test="${naverLogin.email==null}">
				<c:if test="${kakaoLogin.email==null}">
					<div id="notcouponDiv">
						<p style="font-size: 15px; color: white; padding-top:20px;"><b style="font-size: 17px;"><i class="fas fa-ticket-alt"></i> 쿠폰</b> 다운로드 <i class="fas fa-download"></i></p>
					</div>
				</c:if>
			</c:if>
		</c:if>
		
		
		
		
		
		
		
		
		
		
		<!--목록,수정,삭제버튼  스타일-->
		<style>
			#btnDiv{
				margin-left: auto;
				margin-right: auto;
				text-align:center;
				margin-top:80px;
			}
		</style>
		<!--목록,수정,삭제버튼  -->
		<div id="btnDiv">
			<button type="button" onclick="location.href='${path }/event/eventList.do'" class="btn btn-warning">목록</button>
			
			<!-- 관리자만 볼 수있게 분기처리  -->
			<button type="button" class="btn btn-warning" onclick="updateBtn();">수정</button>
			<button type="button" class="btn btn-warning" onclick="removeBtn();">삭제</button>
			<!-- 분기처리끝 -->
			
		</div>
	</div><!-- eventViewDiv닫기 -->


</section>

<script>
	$(document).ready(function(){
	    $("#notcouponDiv").on("click", function(){  
	        alert("로그인이 필요한 서비스입니다.");
	    });   
	    $("#couponDiv").on("click",function(){
	    	window.open('${path}/coupon?eventNo=${event.eventNo}&eventTitle=${event.eventTitle}&couponId=${logginedMember.id}&couponPrice=${couponPrice}','쿠폰발급','width=600,height=250');
	    });
	    $("#snscouponDiv").on("click",function(){
	    	alert("커플리즘회원만 쿠폰을 받을 수 있습니다.");
	    });
	    
	});
	function removeBtn(){
		if(confirm("삭제하면 복구할 수 없습니다. 정말 삭제하시겠습니까?")){ 
			location.replace('${path}/eventRemove?eventNo=${event.eventNo}');
		}
	}	
	function updateBtn(){
		location.replace('${path}/eventUpdate?eventNo=${event.eventNo}');
	}
	/* function coupon() {
		window.open('${path}/coupon','쿠폰발급','width=430,height=200');
	}
	function coupon() {
		alert("쿠폰을 발급받기 위해서는 로그인이 필요합니다.");
	} */
</script>
	
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>