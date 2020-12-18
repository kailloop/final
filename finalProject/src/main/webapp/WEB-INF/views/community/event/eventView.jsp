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
			.couponBtn{
				background: linear-gradient( to right, #FF5050, #FFEB5A);
				height: 70px;
				border-radius: 20px;
				cursor: pointer;
				width:1050px;
				margin-top: 30px;
				outline: none;
				border: none;
				text-align: center;
			}
			.couponBtn p{
				font-size: 15px;
				color: white;
				padding-top:12px;
			}
			.couponBtn b{
				font-size: 17px;
			}
			#couponDiv{
			text-align:center;
				margin-left: auto;
				margin-right: auto;
				width:1050px;
			}
		</style>
		
		
		
		<!--쿠폰배너  -->
		<div id="couponDiv">
			<form name="coupondown" action="#" method="post">
				<input type="hidden" name="couponPrice" value="${event.couponPrice }">
				<input type="hidden" name="eventTitle" value="${event.eventTitle }">
				<input type="hidden" name=eventNo value="${event.eventNo }">
				<c:if test="${logginedMember!=null}">
					<c:if test="${naverLogin==null }">
						<c:if test="${kakaoLogin==null }">
							<input type="hidden" name="couponId" value="${logginedMember.id}">
						</c:if>
					</c:if>
				</c:if>
				
				<!--로그인한 사람들 쿠폰배너  -->
				<c:if test="${logginedMember!=null}">
					<c:if test="${naverLogin==null }">
						<c:if test="${kakaoLogin==null }">
							<c:if test="${c==null }">
								<button type="button" class="couponBtn" onclick="couponDownBtn();">
									<p><b><i class="fas fa-ticket-alt"></i> 쿠폰</b> 다운로드 <i class="fas fa-download"></i></p>
								</button>	
							</c:if>
							<c:if test="${c!=null }">
								<button type="button" class="couponBtn" onclick="afterDownBtn();">
									<p><b><i class="fas fa-ticket-alt"></i> 쿠폰</b> 다운로드 <i class="fas fa-download"></i></p>
								</button>
							</c:if>
						</c:if>
					</c:if>
				</c:if>
				
				
			</form>
		
			<!--네이버,카카오회원 쿠폰배너  -->
			<c:if test="${logginedMember!=null}">
				<c:if test="${naverLogin!=null || kakaoLogin!=null}">
					<button type="button" class="couponBtn" onclick="snscoupon();">
						<p><b><i class="fas fa-ticket-alt"></i> 쿠폰</b> 다운로드 <i class="fas fa-download"></i></p>
					</button>
				</c:if>
			</c:if>
	
			<!--로그인안한 사람들 쿠폰배너  -->	
			<c:if test="${logginedMember==null}">
				<c:if test="${naverLogin==null}">
					<c:if test="${kakaoLogin==null}">
						<button type="button" class="couponBtn" onclick="nocoupon();">
							<p><b><i class="fas fa-ticket-alt"></i> 쿠폰</b> 다운로드 <i class="fas fa-download"></i></p>
						</button>
					</c:if>
				</c:if>
			</c:if>
		</div>
		
		
		
		
		
		
		
		
		
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
			
			<!-- 관리자만 수정,삭제가능  -->
			<c:if test="${logginedMember!=null }">
				<c:if test="${naverLogin==null }">
					<c:if test="${kakaoLogin==null }">				
		            	<c:if test="${logginedMember.id eq 'admin' }">
							<button type="button" class="btn btn-warning" onclick="updateBtn();">수정</button>
							<button type="button" class="btn btn-warning" onclick="removeBtn();">삭제</button>
						</c:if>
					</c:if>
				</c:if>
			</c:if>
			
		</div>
	</div><!-- eventViewDiv닫기 -->


</section>

<script>
	
	function removeBtn(){
		if(confirm("삭제하면 복구할 수 없습니다. 정말 삭제하시겠습니까?")){ 
			location.replace('${path}/eventRemove?eventNo=${event.eventNo}');
		}
	}	
	function updateBtn(){
		location.replace('${path}/eventUpdate?eventNo=${event.eventNo}');
	}
	function nocoupon(){
		alert("커플리즘 회원만 다운가능합니다.");
	}
	function snscoupon(){
		alert("커플리즘 회원만 다운가능합니다.");
	}
	function afterDownBtn(){
		alert("이미 쿠폰을 다운받으셨습니다.");
	}
	
	function couponDownBtn(){
		const frm=$("#couponDownBtn");
		
		const url=window.open('${path}/coupon?eventNo=${event.eventNo}&eventTitle=${event.eventTitle}&couponId=${logginedMember.id}&couponPrice=${event.couponPrice}','쿠폰발급','width=600,height=250');
		frm.attr({
			"action":url,
			"method":"post"
		});
		frm.submit();
	}
	
</script>
	
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>