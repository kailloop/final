<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="title" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/logo.jsp" />
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="${path }/resources/ckeditor/ckeditor.js"></script>
<style>
#map {
	position: relative;
	width: 100%;
	height: 300px;
}

#create {
	position: relative;
	margin: 0;
	margin-left: auto;
	margin-right: auto;
	width: 100%;
	top: -98%;
}

section {
	height: 3500px;
}

section table {
	width: 80%;
	margin: 0;
	margin-left: auto;
	margin-right: auto;
}

#reservation-container {
	position: relative;
	width: 100%;
	height: 100%;
	border: none;
	border-top: 3px gray solid;
	top: 0px;
	z-index: 1;
}

#reservation-img {
	width: 100%;
	height: 100%;
	z-index: -1;
}

#day-btns {
	position: relative;
	height: 200px;
	width: 100%;
}

.day-btns {
	position: relative;
	width: 10%;
	height: 80px;
	left: 0px;
	margin-left: 1.5%;
	margin-right: 1.5%;
	top: 60px;
	cursor: pointer;
	outline: none;
	background: white;
	border: 1px linear-gradient(to right, #DD2D4A, #F26A8D) solid;
	color: #F26A8D;
	transition: 1s;
	border-style: solid;
	border-image: linear-gradient(to right, #DD2D4A 0%, #F49CBB 100%);
	border-image-slice: 1;
	font-family: Nanum Gothic Coding;
	font-size: 24px;
	font-weight: bolder;
	border-image-radius: 30px;
}

#reservation-content {
	margin-top : 100px;
	position: relative;
	width: 100%;
	border: 1px purple solid;
	height: 900px;
}

#reservation-add {
	position: absolute;
	width: 100%;
	height: 100px;
	background-color: transparent;
}

#reservation-addspec {
	position: relative;
	left: 90%;
	width: 10%;
	border-radius: 30px;
	min-height: 100px;
	height: auto;
	text-align: center;
	font-size: 22px;
	top: -85%;
}

#reservation-addspec>div {
	position: relative;
	top: -10%;
	width: 100%;
	height: 72px;
	font-size: 62px;
}

#reservation-addspec>div>i {
	position: relative;
	cursor: pointer;
	color: black;
	top: -15%;
	transition: 0.5s;
}

#reservation-table {
	position: relative;
	width: 100%;
	height: auto;
}

#reservation-table>tr {
	border: 1px blue solid;
	height: 50px;
	font-size: 20px;
}

#reservation-table>tr>td {
	color: black;
}

.td-create {
	text-align: center;
	color: #F26A8D;
	font-size: 20px;
	font-family: Nanum Gothic Coding;
}

.location-input {
	outline: none;
	width: 30%;
	transition: 0.1s;
}

#reservation-add-val {
	position: relative;
	text-align: center;
	width: 90%;
	height: auto;
	left: 0%;
	margin-left: 0;
	color: black;
}

.hourClass {
	position: relative;
	width: 15%;
	outline: none;
	border: none;
	border-bottom: 1px black solid;
	text-align: right;
}

.td-create>label {
	font-weight: bolder;
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
<img id="reservation-img" src="${path }/resources/images/white.jpg">
<div id="create" style="background-color: transparent;">
	<p style="text-align: center; font-size: 30px;">Creat Your Shop</p>
	<form id="createForm" action="${path }/location/Mmodify" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="locationCreator"
			value="${logginedMember.id}">
			<input type="hidden" name="locationNo" value="${location.locationNo}">
		<table>
			<tbody>
				<tr style="border-top: 3px gray solid;"><td colspan="2"><br></td></tr>
				<tr>
					<td class="td-create"><label>제목</label></td>
					<td><input class="location-input" type="text"
						name="locationTitle" value="${location.locationTitle }"></td>
				</tr>
				<tr>
					<td class="td-create"><label>사업장이름</label></td>
					<td><input class="location-input" type="text"
						name="locationName" value="${location.locationName }"></td>
				</tr>
				<tr>
					<td class="td-create"><label>타입</label></td>
					<td id="changeTd"><input type="hidden" name="locationType" value="${location.locationType }"><h5 class="float-left">
						<c:if test="${location.locationType eq 's'}">
            				숙박전체
            			</c:if>
            			<c:if test="${location.locationType eq 's1'}">
            				호텔
            			</c:if>
            			<c:if test="${location.locationType eq 's2'}">
            				펜션
            			</c:if>
            			<c:if test="${location.locationType eq 's3'}">
            				글램핑/캠핑
            			</c:if>
            			<c:if test="${location.locationType eq 's4'}">
            				게스트하우스
            			</c:if>
            			<c:if test="${location.locationType eq 'l'}">
            				명소전체
            			</c:if>
            			<c:if test="${location.locationType eq 'l1'}">
            				랜드마크
            			</c:if>
            			<c:if test="${location.locationType eq 'l2'}">
            				자연/공원
            			</c:if>
            			<c:if test="${location.locationType eq 'l3'}">
            				놀이동산
            			</c:if>
            			<c:if test="${location.locationType eq 'l4'}">
            				워터파크
            			</c:if>
            			<c:if test="${location.locationType eq 'f'}">
            				음식전체
            			</c:if>
            			<c:if test="${location.locationType eq 'f1'}">
            				식당
            			</c:if>
            			<c:if test="${location.locationType eq 'f2'}">
            				카페
            			</c:if>
            			<c:if test="${location.locationType eq 'a'}">
            				액티비티전체
            			</c:if>
            			<c:if test="${location.locationType eq 'a1'}">
            				스키/썰매
            			</c:if>
            			<c:if test="${location.locationType eq 'a2'}">
            				낚시
            			</c:if>
            			<c:if test="${location.locationType eq 'a3'}">
            				수상레저
            			</c:if>
            			<c:if test="${location.locationType eq 'a4'}">
            				바이크
            			</c:if>
            			<c:if test="${location.locationType eq 'sh'}">
            				가게전체
            			</c:if>
            			<c:if test="${location.locationType eq 'sh1'}">
            				특산품가게
            			</c:if>
            			<c:if test="${location.locationType eq 'sh2'}">
            				기념품가게
            			</c:if>
            			<c:if test="${location.locationType eq 'sh3'}">
            				의류가게
            			</c:if>
            			<c:if test="${location.locationType eq 'sh4'}">
            				스포츠가게
            			</c:if>
				</h5><button class="float-left" type="button" onclick="deleteTd();">수정하기</button></td>
				</tr>
				<tr>
					<td class="td-create"><label>지역</label></td>
					<td><input class="location-input" style="width: 30%;"
						type="text" onclick="loadAddress();" id="locationAddress"
						name=" " placeholder="도로명 및 지번 주소 검색"> <input
						class="location-input" style="width: 30%;" type="text"
						name="locationAddressDetail" id="locationAddressDetail"
						placeholder="상세 주소를 적어주세요(선택)"></td>
						<input type="hidden" id="endAddr" name="locationAddress">
				</tr>
				<tr>
					<td class="td-create"><label>메인 이미지</label></td>
					<td><input type="file" id="imgpreview" name="mainFile" onchange="readURL(this);" ></td>
				</tr>
				<!-- <tr><td colspan="2"><input type="file" name="mainFile" ></td></tr> -->
				<tr><td></td><td><img id="preview" src="/couplism/resources/upload/locationMain/${locationMain.renameName }" alt="" width="500px;" height="300px;"/></td></tr>
				<tr>
					<td class="td-create"
						style="border-bottom: 3px gray solid; height: 100px;"><label>전화번호</label><br />
					</td>
					<td><input style="width: 30%;" class="location-input"
						type="text" name="locationPhone" value="${location.locationPhone }" place-holder="000-0000-0000">
				</tr>
				<tr>
					<td colspan="2"><br />
						<div id="map"></div> <br /></td>
				</tr>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6494e3b11b016671e5a8df0ea1d331bf&libraries=services"></script>
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
				<tr style="border-bottom: 3px gray solid;">
					<td colspan="2" style="text-align: center;">
						
						<br>
					</td>
				</tr>
				<tr>
					<td colspan="2"><br><textarea name="locationContent" id="locationContent" style="resize: none;">${location.locationContent }</textarea></td>
				</tr>
				<tr>
					<td colspan="2"><button class="float-right" type="button" onclick="submitForm();">작성</button></td>
				</tr>
			</tbody>
		</table>
		<div id="inputTypeHidden"></div>
	</form>
</div>
<script>
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
			$(".day-btns").hover(function(e){
				$(e.target).css("background","linear-gradient(to right, #DD2D4A, #F49CBB)");
				$(e.target).css("color","white");
			},function(e){
				$(e.target).css("color","#F26A8D");
				$(e.target).css("background","white");
			});
			(function() {
				console.log("실행");
				$('#reservaiton-Tue').hide();
				$('#reservaiton-Wen').hide();
				$('#reservaiton-Thu').hide();
				$('#reservaiton-Fri').hide();
				$('#reservaiton-Sat').hide();
				$('#reservaiton-Sun').hide();
				console.log("온로드");
				console.log("${location.locationTitle}");
				var addrjh = "${location.locationAddress}";
				console.log(addrjh);
				var addrjhSpilt = addrjh.split("/");
				console.log(addrjhSpilt[0]);
				document.getElementById("locationAddress").value = addrjhSpilt[0];
				setCenter();
				document.getElementById("locationAddressDetail").value = addrjhSpilt[1]; 
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
			
		var filecount = 1;
		function selectType(){
			console.log("selectType실해안됌");
			var typeVal=$("#locationType-one").val();
			console.log(typeVal);
			if(typeVal=="n"){
				$("option").remove('.typeTwo');
				$("#locationType-two").append("<option value='N' class='typeTwo'>영업점 서브 테마를 정해주세요</option>");
				return;
			}
			if(typeVal=="s"){
				$("option").remove('.typeTwo');
				$("#locationType-two").append("<option value='N' class='typeTwo'>영업점 서브 테마를 정해주세요</option>");
				$("#locationType-two").append("<option value='1' class='typeTwo'>호텔</option>");
				$("#locationType-two").append("<option value='2' class='typeTwo'>펜션</option>");
				$("#locationType-two").append("<option value='3' class='typeTwo'>글램핑/캠핑</option>");
				$("#locationType-two").append("<option value='4' class='typeTwo'>게스트하우스</option>");
				return;
			}
			if(typeVal=="l"){
				$("option").remove('.typeTwo');
				$("#locationType-two").append("<option value='N' class='typeTwo'>영업점 서브 테마를 정해주세요</option>");
				$("#locationType-two").append("<option value='1' class='typeTwo'>랜드마크</option>");
				$("#locationType-two").append("<option value='2' class='typeTwo'>자연/공원</option>");
				$("#locationType-two").append("<option value='3' class='typeTwo'>놀이동산</option>");
				$("#locationType-two").append("<option value='4' class='typeTwo'>워터파크</option>");
				return;
			}
			if(typeVal=="f"){
				$("option").remove('.typeTwo');
				$("#locationType-two").append("<option value='N' class='typeTwo'>영업점 서브 테마를 정해주세요</option>");
				$("#locationType-two").append("<option value='1' class='typeTwo'>식당</option>");
				$("#locationType-two").append("<option value='2' class='typeTwo'>카페</option>");
				return;
			}
			if(typeVal=="a"){
				$("option").remove('.typeTwo');
				$("#locationType-two").append("<option value='N' class='typeTwo'>영업점 서브 테마를 정해주세요</option>");
				$("#locationType-two").append("<option value='1' class='typeTwo'>스키/썰매</option>");
				$("#locationType-two").append("<option value='2' class='typeTwo'>낚시</option>");
				$("#locationType-two").append("<option value='3' class='typeTwo'>수상레저</option>");
				$("#locationType-two").append("<option value='4' class='typeTwo'>바이크</option>");
				return;
			}
			if(typeVal=="sh"){
				$("option").remove('.typeTwo');
				$("#locationType-two").append("<option value='N' class='typeTwo'>영업점 서브 테마를 정해주세요</option>");
				$("#locationType-two").append("<option value='1' class='typeTwo'>특산품가게</option>");
				$("#locationType-two").append("<option value='2' class='typeTwo'>기념품가게</option>");
				$("#locationType-two").append("<option value='3' class='typeTwo'>의류가게</option>");
				$("#locationType-two").append("<option value='4' class='typeTwo'>스포츠가게</option>");
				return;
			}
		}
		
		
		function selectTypeTwo(){
			var typeVals=$("#locationType-one").val()+$("#locationType-two").val();
			$("#locationType").val(typeVals);
			console.log($("#locationType").val());
		}
		
		function submitForm(){
			var endAddr = $("#locationAddress").val()+"/"+$("#locationAddressDetail").val();
			$("#endAddr").val(endAddr);
			$("#createForm").submit();
		}
		$(function(){
			$("#reservation-plus").click(function(){
				
				var day =  $('#show-div').val();
				var dayArr = day.split("#");
				var dayClass = '.'+dayArr[1];
				var rTime = $('#rTime').val();
				var rTimeReplace = rTime.replace(":","");
				console.log(rTimeReplace);
				var rPrice = $('#rPrice').val();
				var rPeople = $('#rPeople').val();
				if($("#rTimes"+dayArr[1]+rTimeReplace).length>0){
					console.log("이미존재 ");
					alert('해당요일에 해당시간은 이미 존재합니다. 등록을 원하시면 제거후 다시 등록해주십시오');
					return;
				}
				if(rTime == ""){
					alert('시간을 입력해 주세요 .');
					return;
				}
				if(rPrice == ""){
					alert('가격을 입력해 주세요 .');
					return;
				}
				if(rPeople == ""){
					alert('인원수를 입력해 주세요 .');
					return;
				}
				$(day+'-table').append("<tr class='trClass' id='rTimes"+dayArr[1]+rTimeReplace+"' ><td><h1 class='timess'>"+rTime+"</h1></td><td class='"+dayArr[1]+"'>"+"<input type='hidden' value='"+rTime+"'>"+"<h1>"+rPrice+"</h1></td><td><h1>"+rPeople+"</h1></td><td><input type='hidden' name='locationPrice' value='"+rTime+"/"+dayArr[1]+"/"+rPrice+"/"+rPeople+"'></td><td><button onclick='removePrice(event);' type='button'>제거</button></td></tr>");
				
				//여기에 인풋 타입 히든 만드는 로직 작성
				
				var sortEl = $(dayClass);
				//var clone = $('.trClass').clone();
				console.log(dayClass);
				console.log($(sortEl).length);
				var s = $(sortEl).length;
				var coco = [];
				for(var i = 0; i<s; i++){
					console.log("이거밑에");
					console.log($(sortEl));
					console.log($(sortEl).eq(i).val());
					coco.push($(sortEl).eq(i).children("input").eq(0).val().replace(":",""));
				}
				
				console.log(coco);
				coco.sort();
				console.log(coco);
				console.log("이거 밑에 clone");
				for(var i in coco){
					//console.log(coco[i]);
					//console.log("#rTimes"+dayArr[1]+coco[i]);
					//let name = "#rTimes"+dayArr[1]+coco[i];
					//console.log("eq");
					//console.log($(clone).eq(i));
					//console.log("children");
					//console.log($(clone).children().eq(i));
					console.log("#rTimes"+dayArr[1]+coco[i]);
					console.log($("#rTimes"+dayArr[1]+coco[i]));
					var clone = $("#rTimes"+dayArr[1]+coco[i]).clone();
					console.log("이거 밑에 클론");
					console.log(clone);
					$("#rTimes"+dayArr[1]+coco[i]).remove();
					$(day+'-table').append(clone);
				}			
				
				
				
			});
			
			
			$("#imgpreview").change(function(e){
		        let files=e.target.files;
		        let filesArr=Array.prototype.slice.call(files);

		        filesArr.forEach(function(f){
		            if(!f.type.match("image.*")){
		                alert("확장자가 이미지 형태가 아닙니다.");
		                return;
		            }

		            let reader=new FileReader();
		            reader.onload=function(e){
		                $("#preview").attr("src",e.target.result);
		            }
		            reader.readAsDataURL(f);
		        });
		    });
			
			
			$("#reservation-plus").hover(function(){
				$("#reservation-plus").css("color","#F26A8D");
				
			},function(){
				$("#reservation-plus").css("color","black");
			});
			
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
				$(e.target).css("border","1px #F26A8D solid");
			});
			$(".location-input").blur(function(e){
				$(e.target).css("border","1px black solid");
			});
			$(".hourClass").focus(function(e){
				$(e.target).css("border-bottom","1px #F26A8D solid");
			});
			$(".hourClass").blur(function(e){
				$(e.target).css("border-bottom","1px black solid");
			});
		});
		
		function deleteTd(){
			$("#changeTd").children().remove();
			$("input[name=locaionType]").remove();
			$("#changeTd").append("<select id='locationType-one' onchange='selectType();'style='width: 30%; height: 40px;'><option value='n'>영업점 주 테마를 정해주세요</option><option value='s'>숙박</option><option value='l'>명소</option><option value='f'>음식</option><option value='a'>스포츠/레저</option><option value='sh'>가게</option></select> <select id='locationType-two' style='width: 30%; height: 40px;' onchange='selectTypeTwo()'><option class='typeTwo' onchange='selectTypeTwo();' value='N'>영업점 세부 테마를 정해주세요</option></select> <input type='hidden' id='locationType' name='locationType'>");
		}
		
		function removePrice(event){
			console.log("제거누름");
			console.log(event.target);
			$(event.target).parent().parent().eq(0).remove();
		}
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />