<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="ANNIVERSARY" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>

<style>
	#anniversaryWriteDetail{
		margin-top: 100px;
		margin-left: auto;
		margin-right: auto;
		text-align: center;
	}
	#viewTable{
		width: 970px;
		margin-left: auto;
		margin-right: auto;
		margin-top:40px;
	}
</style>

	<div id="anniversaryWriteDetail">
	
	<!--제휴회원 로케이션 다시선택  -->
	<c:if test="${logginedMember!=null }">
		<c:if test="${naverLogin==null }">
			<c:if test="${kakaoLogin==null }">
				<c:if test="${partnerMember !=null}">
					<button type="button" class="btn btn-secondary" onclick="location.href='${path }/anniWrite?userId=${logginedMember.id }'">로케이션 다시 선택하기</button>
				</c:if>
			</c:if>
		</c:if>
	</c:if>
	<!--일반회원 명소 다시선택  -->
	<c:if test="${logginedMember!=null }">
		<c:if test="${naverLogin==null }">
			<c:if test="${kakaoLogin==null }">
				<c:if test="${partnerMember==null}">
					<button type="button" class="btn btn-secondary" onclick="location.href='${path }/anniWriteMember?userId=${logginedMember.id }'">명소 다시 선택하기</button>
				</c:if>
			</c:if>
		</c:if>
	</c:if>
		<form action="${path}/anniversaryWriteEnd?locationNo=${locationNo}" name="anniversaryWriteEndForm" method="post">
			<table id="viewTable" border="1">
				<tr>
					<td>[로케이션]제목</td>
					<td>${location.locationTitle }</td>
				</tr>
				<tr>
					<td>[로케이션]지역</td>
					<td>${location.locationAddress }</td>
				</tr>
				<tr>
					<td>[로케이션]타입</td>
					<c:if test="${location.locationType eq 's'}">	
						<td>숙박전체</td>
					</c:if>
					<c:if test="${location.locationType eq 's1'}">	
						<td>호텔</td>
					</c:if>
					<c:if test="${location.locationType eq 's2'}">	
						<td>펜션</td>
					</c:if>
					<c:if test="${location.locationType eq 's3'}">	
						<td>글램핑/캠핑</td>
					</c:if>
					<c:if test="${location.locationType eq 's4'}">	
						<td>게스트하우스</td>
					</c:if>
					<c:if test="${location.locationType eq 'l'}">	
						<td>명소전체</td>
					</c:if>
					<c:if test="${location.locationType eq 'l1'}">	
						<td>랜드마크</td>
					</c:if>
					<c:if test="${location.locationType eq 'l2'}">	
						<td>자연/공원</td>
					</c:if>
					<c:if test="${location.locationType eq 'l3'}">	
						<td>놀이동산</td>
					</c:if>
					<c:if test="${location.locationType eq 'l4'}">	
						<td>워터파크</td>
					</c:if>
					<c:if test="${location.locationType eq 'f'}">	
						<td>음식전체</td>
					</c:if>
					<c:if test="${location.locationType eq 'f1'}">	
						<td>식당</td>
					</c:if>
					<c:if test="${location.locationType eq 'f2'}">	
						<td>카페</td>
					</c:if>
					<c:if test="${location.locationType eq 'a'}">	
						<td>액티비티전체</td>
					</c:if>
					<c:if test="${location.locationType eq 'a1'}">	
						<td>스키/썰매</td>
					</c:if>
					<c:if test="${location.locationType eq 'a2'}">	
						<td>낚시</td>
					</c:if>
					<c:if test="${location.locationType eq 'a3'}">	
						<td>수상레저</td>
					</c:if>
					<c:if test="${location.locationType eq 'a4'}">	
						<td>바이크</td>
					</c:if>
					<c:if test="${location.locationType eq 'sh'}">	
						<td>가게전체</td>
					</c:if>
					<c:if test="${location.locationType eq 'sh1'}">	
						<td>특산품가게</td>
					</c:if>
					<c:if test="${location.locationType eq 'sh2'}">	
						<td>기념품가게</td>
					</c:if>
					<c:if test="${location.locationType eq 'sh3'}">	
						<td>의류가게</td>
					</c:if>
					<c:if test="${location.locationType eq 'sh4'}">	
						<td>스포츠가게</td>
					</c:if>
					
				</tr>
			
				<tr>
					<td colspan="2">
						<select id="selectBox" name="type" required>
							<option value="op1">기념일을 선택해주세요</option>
							<option value="op2">발렌타인데이</option>
							<option value="op3">화이트데이</option>
							<option value="op4">로즈데이</option>
							<option value="op5">실버데이</option>
							<option value="op6">포토데이</option>
							<option value="op7">와인데이</option>
							<option value="op8">할로윈</option>
							<option value="op9">무비데이</option>
							<option value="op10">허그데이</option>
							<option value="op11">크리스마스</option>
						</select>
						<!-- 제휴회원만 가격선택가능 -->
						<c:if test="${logginedMember!=null }">
							<c:if test="${naverLogin==null }">
								<c:if test="${kakaoLogin==null }">
									<c:if test="${partnerMember !=null}">
										<input type="text" id="peopletext" placeholder="인원수를 적어주세요">
										<input type="text" id="timetext" placeholder="시간을 적어주세요">
										<input type="text" id="pricetext" placeholder="가격을 적어주세요">
										<br>
										<input type="text" style="width: 500px;" id="contenttext" placeholder="내용을 적어주세요">
									</c:if>
								</c:if>
							</c:if>
						</c:if>
						<!--일반회원 가격선택불가능  -->
						<c:if test="${logginedMember!=null }">
							<c:if test="${naverLogin==null }">
								<c:if test="${kakaoLogin==null }">
									<c:if test="${partnerMember==null}">
										<input type="hidden" id="pricetext" value="0">
									</c:if>
								</c:if>
							</c:if>
						</c:if>
						<button type="button" class="btn btn-outline-danger" onclick="clickBtn();">저장</button>
						<button type="reset" class="btn btn-outline-danger" >초기화</button>
						
						<hr>
						<div id="result"></div>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit" class="btn btn-secondary">등록하기</button>
						<button type="button" class="btn btn-outline-secondary" onclick="cancelBtn();">취소하기</button>
					</td>
				</tr>
			</table> 
		</form>
		
		
		
		
	</div><!-- anniversaryWriteDetail닫기 -->


</section>

<script>
	$(document).ready(function(){
		console.log("실행");
		$('#selectBox').change(function(){ console.log($('#selectBox option:selected').text()); });
	});
	var value="";
	$("#pricetext").keyup(function(){
        value=($(this).val());
    });
	function clickBtn(){
		console.log($('#selectBox option:selected').text()); /*셀렉트  */
		console.log(value); /*텍스트  */
		var selectvalue="<input type='text' name='anniversaryType' value='"+$('#selectBox option:selected').text()+"'>";/*셀렉트  */
		var textvalue="<input type='text' name='anniversaryPrice' value='"+$('#pricetext').val()+"'>";/*가격텍스트 */
		var timevalue="<input type='text' name='anniversaryTime' value='"+$('#timetext').val()+"'>";/*시간텍스트  */
		var peoplevalue="<input type='text' name='anniversaryPeople' value='"+$('#peopletext').val()+"'>";/*사람수텍스트  */
		var contentvalue="<input type='text' name='anniversaryContent' value='"+$('#contenttext').val()+"'>";
		
		if($('#selectBox option:selected').text()=='발렌타인데이'){
			$("#result").append("<input type='hidden' name='anniversaryDate' value='2021/02/14'>");
		}
		if($('#selectBox option:selected').text()=='화이트데이'){
			$("#result").append("<input type='hidden' name='anniversaryDate' value='2021/03/14'>");
		}
		if($('#selectBox option:selected').text()=='로즈데이'){
			$("#result").append("<input type='hidden' name='anniversaryDate' value='2021/05/14'>");
		}
		if($('#selectBox option:selected').text()=='실버데이'){
			$("#result").append("<input type='hidden' name='anniversaryDate' value='2021/07/14'>");
		}
		if($('#selectBox option:selected').text()=='포토데이'){
			$("#result").append("<input type='hidden' name='anniversaryDate' value='2021/09/14'>");
		}
		if($('#selectBox option:selected').text()=='와인데이'){
			$("#result").append("<input type='hidden' name='anniversaryDate' value='2021/10/14'>");
		}
		if($('#selectBox option:selected').text()=='할로윈'){
			$("#result").append("<input type='hidden' name='anniversaryDate' value='2021/10/31'>");
		}
		if($('#selectBox option:selected').text()=='무비데이'){
			$("#result").append("<input type='hidden' name='anniversaryDate' value='2021/11/14'>");
		}
		if($('#selectBox option:selected').text()=='허그데이'){
			$("#result").append("<input type='hidden' name='anniversaryDate' value='2021/12/14'>");
		}
		if($('#selectBox option:selected').text()=='크리스마스'){
			$("#result").append("<input type='hidden' name='anniversaryDate' value='2021/12/25'>");
		}
		
		
		$("#result").append(selectvalue);/*셀렉트  */
		$("#result").append(peoplevalue);/* 인원수텍스트 */
		$("#result").append(timevalue);/* 시간텍스트 */
		$("#result").append(textvalue);/* 가격텍스트 */
		$("#result").append("<br>");
		$("#result").append(contentvalue);/*내용텍스트 */
		$("#result").append("<br>");
	}
	 /* var newitem = "<input type='hidden' name='tempApplcntSn' value='"+$(this).val()+"'>";
	 var newitem2 = "<input type='hidden' name='reqstSttusCode' value='"+$("#reqstSttusCode").val()+"'>";
	 $('#changeFrm').append(newitem);
	 $('#changeFrm').append(newitem2); */

	 
	

	/* function printName()  {
		  const name = document.getElementById('name').value;
		  document.getElementById("result").innerText = name;
	} */
	
	function cancelBtn() {
	    if (confirm("작성하신 내용은 저장되지 않습니다. 정말 취소하시겠습니까??") == true){    //확인
	    	location.href="${path }/anniversary/anniversarySearch.do";
	    }else{   //취소
	        return false;
	    }
	}
</script>
	
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>