<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="EVENT" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>
<script type="text/javascript" src="${path }/resources/ckeditor/ckeditor.js"></script>
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
			<p style="text-align: left; height: 50px;">[${location.locationName}]${location.locationTitle }</p>
			<!--[고치기]로케이션리뷰점수평균&갯수 -->
			<p style="text-align: left; font-size:30px; height: 35px;"><i style="color: #FFC314;" class="fas fa-star"></i></i> ${reviewPoint }</p>
			<!--[고치기]로케이션장소  -->
			<p style="text-align: left; font-size:20px; color:#b4b4b4;"><i style= "color: #b4b4b4;" class="fas fa-map-marker-alt"></i>${location.locationAddress }</p>
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
					<td><a href="#box" class="scroll">소개</a></td>
					<td><a href="#box2" class="scroll">리뷰</a></td>
					<td class="chooseTd"><a href="#box3" class="scroll">정보</a></td>
				</tr>
				<tr>
					<td colspan="3">${location.locationContent}</td>
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
					<td><a href="#box" class="scroll">소개</a></td>
					<td><a href="#box2" class="scroll">리뷰</a></td>
					<td class="chooseTd"><a href="#box3" class="scroll">정보</a></td>
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
						<p id="starnum">${reviewPoint}</p>
					</td>
					<td>
						<p style="height: 30px;">별점비율</p>
						<!--고치지  -->
					</td>
				</tr>
				<!--[고치기] 사람들 리뷰내용  -->
				<c:if test="${reservationSize > 0}"><c:if test="${ReviewExist < reservationSize }"><tr><td colspan="2"><button id='addbutton' onclick="addReview(event);" type="button">리뷰작성하기</button></td></tr></c:if></c:if>
				<c:forEach items="${review }" var="ri">
				<tr>
					<td colspan="2">
						<p class="float-left">${ri.reviewId }</p>
						<p class="float-right">${ri.reviewDate }</p>
						<c:choose>
							<c:when test="${ri.reviewGrade == '1'}">
							   <p id="star"><i class="fas fa-star"></i></p>
							</c:when>
							<c:when test="${ri.reviewGrade == '2'}">
							   <p id="star"><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
							</c:when>
							<c:when test="${ri.reviewGrade == '3'}">
							   <p id="star"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
							</c:when>
							<c:when test="${ri.reviewGrade == '4'}">
							   <p id="star"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
							</c:when>
							<c:when test="${ri.reviewGrade == '5'}">
							   <p id="star"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
							</c:when>
							
						</c:choose>
						<p id="starnum">${ri.reviewGrade}</p>
						<p>${ri.reviewContent }</p>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		
		
		<!--상세내용/리뷰/판매자정보  -->
		<div id="box3">
			<table id="boxTable" border="1">
				<tr>
					<td><a href="#box" class="scroll">소개</a></td>
					<td><a href="#box2" class="scroll">리뷰</a></td>
					<td class="chooseTd"><a href="#box3" class="scroll">정보</a></td>
				</tr>
			</table>
		</div>
		
		<!--판매자정보 -->
		<div id="infoDiv" style="margin-top:50px;">
			<table border="1" style="margin-left: auto; margin-right: auto;" width="1050px;">
				<tr>
					<td style="width: 200px; text-align: center;">사업장</td>
					<td><!-- 로케이션타이틀쓰는곳-->${location.locationName }</td>
				</tr>
				<tr>
					<td style="text-align: center;">사업장 위치</td>
					<td><%-- 로케이션폰쓰는곳 --%>${location.locationAddress }</td>
				</tr>
				<tr>
					<td style="width: 200px; text-align: center;">등록자</td>
					<td><!-- 로케이션크리에이터쓰는곳-->${location.locationCreator }</td>
				</tr>
				<tr>
					<td style="text-align: center;">전화번호</td>
					<td><%-- 로케이션폰쓰는곳 --%>${location.locationPhone }</td>
				</tr>
				
			</table>
		</div>
		
		
	</div><!--listViewDiv닫기  -->
	<button onclick="location.replace('${path}/location/locationPayment?locationNo=${location.locationNo }&locationName=${location.locationName }');">결제하기</button>
</section>



<script>

	var reviewTr = 
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){            
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);

		});

	});

	function addReview(event){
		console.log($(event.target).parent().parent());
		$(event.target).parent().append("<form id='form'><textarea name='content' id='locationContent' style='resize: none;'></textarea><button onclick='insertReview();' type='button'>등록하기</button><select name='grade' id='reviewGrade'><option value='5'>★★★★★</option><option value='4'>★★★★☆</option><option value='3'>★★★☆☆</option><option value='2'>★★☆☆☆</option><option value='1'>★☆☆☆☆</option></select>");
		$("#addbutton").remove();
	$(function(){
	    
	    CKEDITOR.replace( 'locationContent', {//해당 이름으로 된 textarea에 에디터를 적용
	        width:'100%',
	        height:'400px',
	        filebrowserImageUploadUrl: '${path}/location/imageUpload?creator=${logginedMember.id}' //여기 경로로 파일을 전달하여 업로드 시킨다.
	    });
	     
	     
	    CKEDITOR.on('dialogDefinition', function( ev ){
	        var dialogName = ev.data.name;
	        var dialogDefinition = ev.data.definition;
	      
	        switch (dialogName) {
	            case 'image': //Image Properties dialog
	                //dialogDefinition.removeContents('info');
	                dialogDefinition.removeContents('Link');
	                dialogDefinition.removeContents('advanced');
	                break;
	        }
	    });
	     
	});
	}
	
	function insertReview(){
		var reviewContent = CKEDITOR.instances.locationContent.getData();
		var reviewGrade = $("#reviewGrade").val();
		console.log(CKEDITOR.instances.locationContent.getData());
		console.log(reviewContent);
		console.log(${location.locationNo});
		var jhData = {
			id : "${logginedMember.id}",
			locationNo : ${location.locationNo},
			content : CKEDITOR.instances.locationContent.getData(),
			grade : reviewGrade
		};
		$.ajax({
			url:"${path}/location/AddReview",
			data : jhData,
			success:data => {
					console.log(data);
					location.replace('${path}/location/locationView?locationNo=${location.locationNo}&id=${logginedMember.id}');
			},
			fail:error =>{
				
			}  
		});
	}
</script>
	
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>