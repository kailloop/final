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
			}
		</style>
		
		<!--상단 제목  -->
		<div id="titleDiv">
			<p>로케이션타이틀</p>
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
			#listTable{
				margin-left: auto; 
				margin-right: auto;
				width:1050px;
			}
			#listTable td{
				width: 200px;
				text-align: center;
			}
		</style>
		
		<!--리스트  -->
		<div id="listDiv" style="width: 1050px; margin-left: auto; margin-right: auto;">
			<!--내용  -->			
			<img class="imgclass" alt="" src="${path }/resources/images/home-logo2.jpg" width="100%;" height="600px;">
			<img class="imgclass" alt="" src="${path }/resources/images/home-logo3.jpg" width="100%;" height="600px;">
			<img class="imgclass" alt="" src="${path }/resources/images/faq.jpg" width="100%;" height="600px;">
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
		
		<!--리뷰  -->
		<div id="reviewDiv" style="margin-left: auto; margin-right: auto; text-align: center; margin-top:50px;" >
		
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