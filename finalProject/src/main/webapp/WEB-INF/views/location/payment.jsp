<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>
		<div>
			<h1>${locationName}</h1>
			<input id="selectDate" type="date" onchange="dateChange();">
			<table id="priceTable">
				<tr><th>시간</th><th>가격</th><th>예약가능 인원</th><th>버튼</th></tr>
			</table>
			<div id="addPrice"></div>
			<button onclick="payment();">결제하기</button>
			
		</div>
		<script>
			function dateChange(){
				var selectDay = $("#selectDate").val();
				$("#price").remove();
				$.ajax({
					url:"${path}/location/dateLogic?day="+selectDay+"&locationNo=${locationNo}",
					success:data => {
							console.log(data);
							console.log(selectDay);
							var parseData = JSON.parse(data);
							console.log(parseData);
							console.log("사이즈 : "+parseData.length);
							if(parseData.length>0){
								for(var a=0; a<parseData.length; a++){
								console.log(parseData[a].locationNo);
								$("#priceTable").append("<tr id ='price'><td>"+parseData[a].priceTime+"</td><td>"+parseData[a].price+"</td><td>"+parseData[a].pricePeople+"</td><td><button id='priceButton'>추가</button></td><td><div><input type='text' value='"+parseData[a].priceTime+"-"+parseData[a].price+"-"+parseData[a].pricePeople+"'></div></td></tr>")
								}
								$("#priceButton").click(function addPrice(){
									console.log("addPrice");
									console.log($(this).parent().parent().children().eq(4).children().eq(0).children().eq(0).val());
									var priceValue = $(this).parent().parent().children().eq(4).children().eq(0).children().eq(0).val();
									var priceValueArr = priceValue.split("-");// 0.시간  1.가격   2.사람수
									var selectDayArr = selectDay.split("-");//0.년도  1.월   2.일
									console.log(Number(priceValueArr[2]));
									var forCount = Number(priceValueArr[2])+1;
									console.log(forCount);
									var option = "";
									for(var i = 1; i<forCount; i++){
										option += "<option value='"+i+"'>"+i+"</option>";
									}
									console.log(option);
									console.log(priceValueArr);
									$("#addPrice").append("<div><p>"+selectDayArr[0]+"년 "+selectDayArr[1]+"월 "+selectDayArr[2]+"일 "+priceValueArr[0]+" </p><input type='text' value='"+priceValueArr[0]+"'><input type='text' value='"+selectDay+"'><select>"+option+"</select><p>명</p></div>");
								});
							}
					},
					fail:error =>{
						
					}  
				});
			};
			function payment(){
				console.log("들어옴");
				console.log($("#addPrice").children().length);
				if($("#addPrice").children().length>0){
					for(var l = 0; l<$("#addPrice").children().length; l++){
						console.log($("#addPrice").children().eq(l).children());
						var checkDay = $("#addPrice").children().eq(l).children().eq(2).val();
						var checkTime = $("#addPrice").children().eq(l).children().eq(1).val();
						var checkPeople = $("#addPrice").children().eq(l).children().eq(3).val();
						console.log(checkDay);
						console.log(checkTime);
						console.log(checkPeople);
						$.ajax({
							url:"${path}/location/checkReservation?day="+checkDay+"&no=${locationNo}&time="+checkTime+"&people="+checkPeople,
							success:data => {
									console.log(data);
							},
							fail:error =>{
								
							}  
						});
						
						
					}
					
					console.log("if문 들어옴");
					
				}
			}
		</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>