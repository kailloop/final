<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

		<div>
			<h1>${test}</h1>
			<h1>locationName ->${locationName }</h1>
			<h1>locationNo -> ${locationNo }</h1>
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
				console.log("price");
				$(".pricetr").remove();
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
								$("#priceTable").append("<tr class='pricetr'><td>"+parseData[a].priceTime+"</td><td>"+parseData[a].price+"</td><td>"+parseData[a].pricePeople+"</td><td><button class='priceButton'>추가</button></td><td><div><input type='text' value='"+parseData[a].priceTime+"-"+parseData[a].price+"-"+parseData[a].pricePeople+"'></div></td></tr>")
								}
								$(".priceButton").click(function addPrice(){
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
									$(".rowOfPayment").remove();
									$("#addPrice").append("<div class='rowOfPayment'><p>"+selectDayArr[0]+"년 "+selectDayArr[1]+"월 "+selectDayArr[2]+"일 "+priceValueArr[0]+" </p><input type='text' value='"+priceValueArr[0]+"'><input type='text' value='"+selectDay+"'><select>"+option+"</select><p>명</p><input type='text' placeholder='대표자성함'><input type='text' value='"+priceValueArr[1]+"'></div>");
								});
							}
					},
					fail:error =>{
						
					}  
				});
			};
			function payment(){
				console.log("${locationName}");
				console.log("들어옴");
				console.log($("#addPrice").children().length);
				if($("#addPrice").children().length>0){
					for(var l = 0; l<$("#addPrice").children().length; l++){
						console.log($("#addPrice").children().eq(l).children());
						var checkDay = $("#addPrice").children().eq(l).children().eq(2).val();
						var checkTime = $("#addPrice").children().eq(l).children().eq(1).val();
						var checkPeople = $("#addPrice").children().eq(l).children().eq(3).val();
						var checkName = $("#addPrice").children().eq(l).children().eq(5).val();
						var checkPrice = $("#addPrice").children().eq(l).children().eq(6).val();
						console.log(checkDay);
						console.log(checkTime);
						console.log(checkPeople);
						console.log(checkName);
						console.log(checkPrice);
						$.ajax({
							url:"${path}/location/checkReservation?day="+checkDay+"&no=${locationNo}&time="+checkTime+"&people="+checkPeople,
							success:data => {
									console.log(data=='"true"');
									console.log("${locationName}");	
									console.log('${logginedMember.id}');
									console.log('${logginedMember.location}');
									console.log('${logginedMember.phone}');
									console.log('${logginedMember.email}');
									console.log('location-${locationNo}');
									if(data=='"true"'){
										//여기서 결제 api실행 !! 
										var IMP = window.IMP; // 생략가능
										IMP.init('imp36196413'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

											IMP.request_pay({
											    pg : 'inicis', // version 1.1.0부터 지원.
											    pay_method : 'html5_inicis',
											    merchant_uid : 'merchant_' + new Date().getTime(),
											    name : "${logginedMember.id}/${locationNo}"+"/"+checkDay+"/"+checkTime+"/"+checkPeople+"명",
											    amount : checkPrice*checkPeople,
											    buyer_email : '${logginedMember.id}',
											    buyer_name : checkName,
											    buyer_tel : '${logginedMember.phone}',
											    buyer_addr : '${logginedMember.location}',
											    buyer_postcode : 'location-${locationNo}',
											    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		
											}, function(rsp) {
											    if ( rsp.success ) {
											        var msg = '결제가 완료되었습니다.';
											        msg += '고유ID : ' + rsp.imp_uid;
											        msg += '상점 거래ID : ' + rsp.merchant_uid;
											        msg += '결제 금액 : ' + rsp.paid_amount;
											        msg += '카드 승인번호 : ' + rsp.apply_num;
											        //성공했을때 db에 데이터 등록 ajax이용
											        $.ajax({
														url:"${path}/location/insertReservation?locationNo=${locationNo}&id=${logginedMember.id}&name="+checkName+"&time="+checkTime+"&day="+checkDay+"&people="+checkPeople+"&price="+checkPrice,
														success:data => {
															alert("성공적으로 예약이 완료 되었습니다.");
															location.href='${path}/location/locationView?locationNo=${locationNo}';
														},
														fail:error =>{
															alert('결제는 완료하였으나 데이터가 등록되지 못했습니다. 관리자에게 문의 부탁드립니다.');
														}  
													});
											        
											    } else {
											        var msg = '결제에 실패하였습니다.';
											        msg += '에러내용 : ' + rsp.error_msg;
											    }
											    alert(msg);
											});
									}
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