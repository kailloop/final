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
         <img class="imgclass" alt="" src='${path }/${locationMain }' width="100%;" height="600px;"/>
         
         <p style="text-align: left; height: 50px;">[${location.locationName}]${location.locationTitle }</p>
         <!--[고치기]로케이션리뷰점수평균&갯수 -->
         <p style="text-align: left; font-size:30px; height: 35px;"><i style="color: #FFC314;" class="fas fa-star"></i></i> ${reviewPoint }</p>
         <!--[고치기]로케이션장소  -->
         <div id="map" style="width:100%;height:350px;"></div>
         <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6494e3b11b016671e5a8df0ea1d331bf&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${mapPath}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;font-size:8px;">${location.locationAddress}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
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
      
      <!--[소개]상세내용/리뷰/가격/판매자정보 -->
      <div id="box">
         <table id="boxTable" border="1">
            <tr>
               <td class="chooseTd"><a href="#box" class="scroll">상세내용</a></td>
               <td><a href="#box2" class="scroll">리뷰</a></td>
            </tr>
            <tr>
               <td colspan="4">${location.locationContent}</td>
            </tr>
         </table>
      </div>
      
      

      
      
      <!--[가격]상세내용/리뷰/가격/판매자정보  -->
      <div id="box2">
         <table id="boxTable" border="1">
            <tr>
               <td><a href="#box" class="scroll">상세내용</a></td>
               <td class="chooseTd"><a href="#box2" class="scroll">리뷰</a></td>
            </tr>
         </table>
      </div>
      <!--가격 스타일  -->
      <style>
         #priceDiv{
            margin-left: auto; 
            margin-right: auto; 
            text-align: center; 
            margin-top:50px;
         }
         #priceTable{
            margin-left: auto; 
            margin-right: auto;
            width:1050px;
         }
         #priceTable td{
            width: 33.5%;
         }
         #priceTable th{
            color:#A5E3E6;
         }
      </style>
      <!--가격  -->
      <div id="priceDiv">
         <table id="priceTable" border="1">
            <c:if test="${anniversaryList!=null}">
               <tr>
                  <th>[기념일]타입/날짜</th>
                  <th>[기념일]시간</th>
                  <th>[기념일]가격</th>
               </tr>
                  <c:forEach var="anniversaryList" items="${anniversaryList }">
               <tr>
                  <td>
                     [<c:out value="${anniversaryList.anniversaryType }"/>]
                     <c:out value="${anniversaryList.anniversaryDate }"/>
                  </td>
                  <td>
                     <c:out value="${anniversaryList.anniversaryTime }"/>
                  </td>
                  <td>
                     <c:out value="${anniversaryList.anniversaryPrice }"/>
                  </td>
               </tr>
               </c:forEach>
            </c:if>
         </table>
      </div>
      
      
      
      <!--[리뷰] 상세내용/리뷰/가격/판매자정보  -->
      
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
            <tr><td colspan="2"><button id='addbutton' onclick="addReview(event);" type="button">리뷰작성하기</button></td></tr>
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
      
      
		<c:if test="${location.locationCreator eq logginedMember.id}"><button>수정</button><button>삭제</button></c:if>
   </div><!--listViewDiv닫기  -->
   
</section>



<script>

   var reviewTr = 
   jQuery(document).ready(function($) {
      $(".scroll").click(function(event){            
         event.preventDefault();
         $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);

      });

   });
   
	function buy(){
		if(${logginedMember.id != null}){
			location.replace('${path}/location/locationPayment?locationNo=${location.locationNo }&locationName=${location.locationName }');
		}else{
			alert("로그인후 이용해주세요.");
		}
	}

   function addReview(event){
	  if(${logginedMember.id eq null}){
		  alert("로그인후 이용해주세요.");
		 return;
	  }
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
   (function() {
		console.log("실행");
		$('#reservaiton-Tue').hide();
		$('#reservaiton-Wen').hide();
		$('#reservaiton-Thu').hide();
		$('#reservaiton-Fri').hide();
		$('#reservaiton-Sat').hide();
		$('#reservaiton-Sun').hide();
	}());
   
   $("#btn-Mon").click(function(){
		var day = $('#show-div').val();
		$(day).hide();
		$('#reservaiton-Mon').show();
		$('#show-div').val("#reservaiton-Mon");
	});
	$("#btn-Tue").click(function(){
		var day = $('#show-div').val();
		$(day).hide();
		$('#reservaiton-Tue').show();
		$('#show-div').val("#reservaiton-Tue");
	});
	$("#btn-Wen").click(function(){
		var day = $('#show-div').val();
		$(day).hide();
		$('#reservaiton-Wen').show();
		$('#show-div').val("#reservaiton-Wen");
	});
	$("#btn-Thu").click(function(){
		var day = $('#show-div').val();
		$(day).hide();
		$('#reservaiton-Thu').show();
		$('#show-div').val("#reservaiton-Thu");
	});
	$("#btn-Fri").click(function(){
		var day = $('#show-div').val();
		$(day).hide();
		$('#reservaiton-Fri').show();
		$('#show-div').val("#reservaiton-Fri");
	});
	$("#btn-Sat").click(function(){
		var day = $('#show-div').val();
		$(day).hide();
		$('#reservaiton-Sat').show();
		$('#show-div').val("#reservaiton-Sat");
	});
	$("#btn-Sun").click(function(){
		var day = $('#show-div').val();
		$(day).hide();
		$('#reservaiton-Sun').show();
		$('#show-div').val("#reservaiton-Sun");
	});
   
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