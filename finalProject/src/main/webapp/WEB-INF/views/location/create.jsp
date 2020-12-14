<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="" name="title"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
#map{
	position:relative;
	width:100%;
	height:300px;
}
#create{
	position:relative;
	margin:0;
	margin-left:auto;
	margin-right:auto;
	width:100%;
}
section table{
	width:80%;
	margin:0;
	margin-left:auto;
	margin-right:auto;
	
}
#reservation-container{
		position:relative;
		width:100%;
		height:1200px;
		border:1px red solid;
		top:0px;
	}
	#day-btns{
		position:relative;
		height:200px;
		width:100%;
	}
	.day-btns{
		position:relative;
		width:10%;
		height:80px;
		left:0px;
		margin-left:1.5%;
		margin-right:1.5%;
		top:60px;
		cursor:pointer;
		outline:none;
		background:white;
		border:1px linear-gradient(to right,#DD2D4A,#F26A8D) solid;
		color:#F26A8D;
		transition:1s;
		border-style: solid;
		border-image: linear-gradient(to right, #DD2D4A 0%, #F49CBB 100%);
		border-image-slice: 1;
		font-family:Nanum Gothic Coding;
		font-size:24px;
		border-image-radius:30px;
	}
	#reservation-content{
		position:relative;
		width:100%;
		border:1px purple solid;
		height:900px;
	}
	#reservation-add{
		position:relative;
		width:100%;
		border:1px yellow solid;
		height:100px;
	}
	#reservation-addspec{
		position:relative;
		left:90%;
		width:10%;
		border:1px red solid;
		border-radius:30px;
		height:100px;
		text-align:center;
		font-size:22px;
	}
	#reservation-addspec > div{
		position:relative;
		top:25.5%;
		width:100%;
		border:1px purple solid;
	}
	#reservation-table{
		position:relative;
		width:100%;
		height:auto;
	}
	#reservation-table > tr{
		border:1px blue solid;
		height:50px;
		font-size:20px;
	}
	#reservation-table > tr > td{
		color:black;
		
	}
	.td-create{
		text-align:center;
		color:#F26A8D;
		font-size:20px;
		font-family:Nanum Gothic Coding;
	}
	.location-input{
		outline:none;
		width:100%;
		transition:0.5s;
	}
</style>
<script>
function loadAddress() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                //document.getElementById("sample6_extraAddress").value = extraAddr;
            } else {
                //document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("locationAddress").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("locationAddressDetail").focus();
            setCenter();
        }
    }).open();
}
</script>
	<div id="create">
			<form action="${path }/location/createEnd" method="post" enctype="multipart/form-data">
				<input type="hidden" name="locationCreator" value="${logginedMember.id}">
				<table>
					<tbody>
						<tr><td class="td-create"><label>제목</label></td><td><input class="location-input" type="text" name="locationTitle"></td></tr>
						<tr><td class="td-create"><label>타입</label></td>
							<td>
								<select id="locationType-one" onchange="selectType()" style="width:49.5%;height:40px;">
									<option value="N">영업점 주 테마를 정해주세요</option>
									<option value="S">숙박</option>
									<option value="L">명소</option>
									<option value="F">음식</option>
									<option value="A">스포츠/레저</option>
									<option value="SH">가게</option>
								</select>
								<select id="locationType-two" style="width:49.5%;height:40px;">
									<option class="typeTwo" value="N">영업점 세부 테마를 정해주세요</option>
								</select>
								<input type="hidden" id="locationType" name="locationType">
							</td>
						</tr>
						<tr>
							<td class="td-create">
								<label>지역</label>
							</td>
							<td>
								<input class="location-input" style="width:49.5%;" type="text" onclick="loadAddress();" onchange="loadMap()" id="locationAddress" name="locationAddress" placeholder="도로명 및 지번 주소 검색">
								<input class="location-input" style="width:49.5%;" type="text" name="locationAddressDetail" id="locationAddressDetail" placeholder="상세 주소를 적어주세요(선택)">
							</td>
						</tr>
						<tr><td class="td-create"><label>메인 이미지</label></td><td><input type="file" name="mainFile"></td></tr>
						<tr><td class="td-create"><label>세부 이미지</label></td><td>
								<div id="div-container-file">
									<div class="input-group mb-3">
									  <div class="input-group-prepend">
									    <span class="input-group-text" id="inputGroupFileAddon01">파일</span>
									  </div>
									  <div class="custom-file">
									    <input name="locationFile" onchange="changeFile(event);" type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
									    <label class="custom-file-label" for="inputGroupFile01">여기를 클릭하여 파일을 선택하세요.</label>
									  </div>
									  <button id="addInputFile" style="width:80px;" type="button">+</button>
									</div>
								</div></td></tr>
						<tr>
							<td class="td-create">전화번호
							</td>
							<td>
								<input style="width:32.5%;" class="location-input" type="text" name="locationPhone" place-holder="000">
								<input style="width:32.5%;" class="location-input" type="text" name="locationPhone" place-holder="0000">
								<input style="width:32.5%;" class="location-input" type="text" name="locationPhone" place-holder="0000">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div id="map"></div>
							</td>
						</tr>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6494e3b11b016671e5a8df0ea1d331bf&libraries=services"></script>
				<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };

				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
				function setCenter() {            
				 // 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();

					// 주소로 좌표를 검색합니다
					geocoder.addressSearch($("#locationAddress").val(), function(result, status) {

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
					            content: '<div style="width:100px;text-align:center;"><div style="position:relative;left:25px;color:black;margin-left:auto;margin-right:auto;">지정 주소</div></div>'
					        });
					        infowindow.open(map, marker);

					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map.setCenter(coords);
						    } 
						});
				}
		</script>
		<tr>
	<td colspan="2" style="text-align:center;">
		<div id="reservation-container">
		<div id="day-btns">
			<button type="button" class="day-btns">월요일</button>
			<button type="button" class="day-btns">화요일</button>
			<button type="button" class="day-btns">수요일</button>
			<button type="button" class="day-btns">목요일</button>
			<button type="button" class="day-btns">금요일</button>
			<button type="button" class="day-btns">토요일</button>
			<button type="button" class="day-btns">일요일</button>
		</div>
		<div id="reservation-add">
			<div id="reservation-addspec">
				<div>예약 추가</div>
			</div>
		</div>
		<div id="reservation-content">
			<table id="reservation-table">
				<tr>
					<th>시간</th>
					<th>가격</th>
					<th>인원 수</th>
					<th>날짜</th>
				</tr>
				<tr>
					<td>10:00 ~ 12:00</td>
					<td>12000</td>
					<td>8 명</td>
					<td>2020.12.22</td>
				</tr>
			</table>
		</div>
	</div>
	</td></tr>
	<tr><td>내용</td><td><textarea name="locationContent" class="form-control" style="resize: none;"rows="30"></textarea></td></tr>
		<script>
			$(".day-btns").hover(function(e){
				$(e.target).css("background","linear-gradient(to right, #DD2D4A, #F49CBB)");
				$(e.target).css("color","white");
			},function(e){
				$(e.target).css("color","#F26A8D");
				$(e.target).css("background","white");
			});
		</script>
</td></tr>
					</tbody>
				</table>
				<input type="submit">
			</form>
		</div>
			<script>
		var filecount = 1;
		function selectType(){
			var typeVal=$("#locationType-one").val();
			if(typeVal=="N"){
				$("option").remove('.typeTwo');
				$("#locationType-two").append("<option value='N' class='typeTwo'>영업점 서브 테마를 정해주세요</option>");
				return;
			}
			if(typeVal=="S"){
				$("option").remove('.typeTwo');
				$("#locationType-two").append("<option value='1' class='typeTwo'>호텔</option>");
				$("#locationType-two").append("<option value='2' class='typeTwo'>펜션</option>");
				$("#locationType-two").append("<option value='3' class='typeTwo'>글램핑/캠핑</option>");
				$("#locationType-two").append("<option value='4' class='typeTwo'>게스트하우스</option>");
				return;
			}
			if(typeVal=="L"){
				$("option").remove('.typeTwo');
				$("#locationType-two").append("<option value='1' class='typeTwo'>랜드마크</option>");
				$("#locationType-two").append("<option value='2' class='typeTwo'>자연/공원</option>");
				$("#locationType-two").append("<option value='3' class='typeTwo'>놀이동산</option>");
				$("#locationType-two").append("<option value='4' class='typeTwo'>워터파크</option>");
				return;
			}
			if(typeVal=="F"){
				$("option").remove('.typeTwo');
				$("#locationType-two").append("<option value='1' class='typeTwo'>식당</option>");
				$("#locationType-two").append("<option value='2' class='typeTwo'>카페</option>");
				return;
			}
			if(typeVal=="A"){
				$("option").remove('.typeTwo');
				$("#locationType-two").append("<option value='1' class='typeTwo'>스키/썰매</option>");
				$("#locationType-two").append("<option value='2' class='typeTwo'>낚시</option>");
				$("#locationType-two").append("<option value='3' class='typeTwo'>수상레저</option>");
				$("#locationType-two").append("<option value='4' class='typeTwo'>바이크</option>");
				return;
			}
			if(typeVal=="SH"){
				$("option").remove('.typeTwo');
				$("#locationType-two").append("<option value='1' class='typeTwo'>특산품가게</option>");
				$("#locationType-two").append("<option value='2' class='typeTwo'>기념품가게</option>");
				$("#locationType-two").append("<option value='3' class='typeTwo'>의류가게</option>");
				$("#locationType-two").append("<option value='4' class='typeTwo'>스포츠가게</option>");
				return;
			}
		}
		$(function(){
			$('[name=noticeFile]').change(e => {
				var file = $(e.target)[0].files[0];
				if(file!=null){
					$(e.target).next(".custom-file-label").html(file.name);
				}else{
					console.log(file);
					$(e.target).next(".custom-file-label").html("여기를 클릭하여 파일을 선택하세요.");
				}
			});
			$(".location-input").focus(function(e){
				$(e.target).css("border","2px #F26A8D solid");
			});
			$(".location-input").blur(function(e){
				$(e.target).css("border","1px black solid");
			});
		});
		$(function(){
			$('#addInputFile').click(e => {
				if(filecount < 5){
					$("#div-container-file").append("<div class='input-group mb-3'><div class='input-group-prepend'><span class='input-group-text' id='inputGroupFileAddon01'>파일</span></div><div class='custom-file'><input name='locationFile' onchange='changeFile(event);' type='file' class='custom-file-input' id='inputGroupFile01' aria-describedby='inputGroupFileAddon01'><label class='custom-file-label' for='inputGroupFile01'>여기를 클릭하여 파일을 선택하세요.</label></div><button onclick='deleteInputFile(event);' type='button' style='width:80px;''>삭제</button></div>");
					filecount++;
				}
			})
		});
		function deleteInputFile(event){
			$(event.target).parent().remove();
			filecount--;
		}
		function changeFile(event){
			var file = $(event.target)[0].files[0];
			if(file!=null){
				$(event.target).next(".custom-file-label").html(file.name);
			}else{
				console.log(file);
				$(event.target).next(".custom-file-label").html("여기를 클릭하여 파일을 선택하세요.");
			}
		}
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>