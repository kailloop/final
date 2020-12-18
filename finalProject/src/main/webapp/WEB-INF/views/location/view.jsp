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
	.chooseTd{
		background: #A5E3E6;
		
	}
	.chooseTd a{
		font-weight: bold;
		color:#969696;
	}
	table td a:hover {
		color:#969696;
	}
</style>

	<div id="listViewDiv" style="margin-top: 80px;">
		
		<!--상단 제목  스타일-->
		<style>
			#titleDiv{
				text-align:center;
				font-size:50px;
				font-weight: bold;
				color:black;
				width: 1050px;
				margin-left: auto; 
				margin-right: auto;
			}
		</style>
		
		<!--상단 제목  -->
		<div id="titleDiv">
			<!--[고치기]로케이션메인사진  -->
			<img class="imgclass" alt="" src="${path }/resources/images/home-logo2.jpg" width="100%;" height="600px;">
			<p style="text-align: left; height: 50px;">로케이션타이틀</p>
			<!--[고치기]로케이션리뷰점수평균&갯수 -->
			<p style="text-align: left; font-size:30px; height: 35px;"><i style="color: #FFC314;" class="fas fa-star"></i></i> 4.5</p>
			<!--[고치기]로케이션장소  -->
			<p style="text-align: left; font-size:20px; color:#b4b4b4;"><i style= "color: #b4b4b4;" class="fas fa-map-marker-alt"></i> 서울특별시 강남구 테헤란로14길 6 남도빌딩</p>
		</div>
		
		<!--상세내용/리뷰  스타일-->
		<style>
			#boxTable{
				margin-left: auto;
				margin-right: auto;
				width:1050px;
				text-align: center;
				margin-top:50px;
			}
			#boxTable td{
				width: 350px;
			}
			td a{
				color:black;
				font-size:23px;
			}
		</style>
		
		<!--상세내용/리뷰/판매자정보  -->
		<div id="box">
			<table id="boxTable" border="1">
				<tr>
					<td class="chooseTd"><a href="#box" class="scroll">상세정보</a></td>
					<td><a href="#box2" class="scroll">리뷰</a></td>
					<td><a href="#box3" class="scroll">판매자정보</a></td>
				</tr>
			</table>
		</div>
		
		
		<!--리스트 스타일 -->
		<style>
			#listDiv{
				margin-top:50px;
			}
			
		</style>
		
		<!--[고치기]리스트  -->
		<div id="listDiv" style="width: 1050px; margin-left: auto; margin-right: auto;">
			<!--내용  -->			
			
		</div>
		
		<!--상세내용/리뷰/판매자정보  -->
		<div id="box2">
			<table id="boxTable" border="1">
				<tr>
					<td><a href="#box" class="scroll">상세정보</a></td>
					<td class="chooseTd"><a href="#box2" class="scroll">리뷰</a></td>
					<td><a href="#box3" class="scroll">판매자정보</a></td>
				</tr>
			</table>
		</div>
		
		<!--리뷰  스타일-->
		<style>
			#reviewDiv{
				margin-left: auto; 
				margin-right: auto; 
				text-align: center; 
				margin-top:50px;
			}
			#reviewTable{
				margin-left: auto; 
				margin-right: auto;
				width:1050px;
			}
			td{
				width:50%;
			}
			#star{
				color:#FFC314;
				font-size: 50px;
				height: 45px;
			}
			#starnum{
				font-size:50px;
				color:black;
			}
		</style>
		
		<!--리뷰  -->
		<div id="reviewDiv">
			<table id="reviewTable" border="1">
				<tr>
					<td>
						<p style="height: 30px;">평균별점</p>
						<p id="star"><i class="fas fa-star"></i></p>
						<p id="starnum">4.5</p>
					</td>
					<td>
						<p style="height: 30px;">별점비율</p>
						<!--고치지  -->
					</td>
				</tr>
				<!--[고치기] 사람들 리뷰내용  -->
				<tr>
					<td colspan="2"></td>
				</tr>
			</table>
		</div>
		
		
		<!--상세내용/리뷰/판매자정보  -->
		<div id="box3">
			<table id="boxTable" border="1">
				<tr>
					<td><a href="#box" class="scroll">상세정보</a></td>
					<td><a href="#box2" class="scroll">리뷰</a></td>
					<td class="chooseTd"><a href="#box3" class="scroll">판매자정보</a></td>
				</tr>
			</table>
		</div>
		
		<!--판매자정보 -->
		<div id="infoDiv" style="margin-top:50px;">
			<table border="1" style="margin-left: auto; margin-right: auto;" width="1050px;">
				<tr>
					<td style="width: 200px; text-align: center;">사업장</td>
					<td><!-- 로케이션타이틀쓰는곳--></td>
				</tr>
				<tr>
					<td style="width: 200px; text-align: center;">판매자</td>
					<td><!-- 로케이션크리에이터쓰는곳--></td>
				</tr>
				<tr>
					<td style="text-align: center;">전화번호</td>
					<td><%-- 로케이션폰쓰는곳 --%></td>
				</tr>
				<!-- <tr> 추가할 거 있으면 추가
					<td></td>
				</tr> -->
			</table>
		</div>
		
		
	</div><!--listViewDiv닫기  -->


</section>

<script>
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){            
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);

		});

	});


</script>
	
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>