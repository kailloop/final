<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>

	<div id="locationListDiv" style=" margin-top:20px; margin-left:auto; margin-right:auto; width: 1050px; text-align: center;">
		
	
		
		
		
		<!--상단 스타일 -->
		<style>
			#topdiv{
				text-align: left;
				margin-left: 30px;
				margin-top: 60px;
			}
		</style>
		<!--상단 -->
		<div id="topdiv">
			
			<a><i class="fas fa-home"></i></a>
			<a style="color:black; font-weight: bold;">${address }</a><a> ></a>
			
			<c:if test="${category eq 's'}">	
				<a style="color:black; font-weight: bold;">숙박전체</a>
			</c:if>
			<c:if test="${category eq 's1'}">	
				<a style="color:black; font-weight: bold;">호텔</a>
			</c:if>
			<c:if test="${category eq 's2'}">	
				<a style="color:black; font-weight: bold;">펜션</a>
			</c:if>
			<c:if test="${category eq 's3'}">	
				<a style="color:black; font-weight: bold;">글램핑/캠핑</a>
			</c:if>
			<c:if test="${category eq 's4'}">	
				<a style="color:black; font-weight: bold;">게스트하우스</a>
			</c:if>
			<c:if test="${category eq 'l'}">	
				<a style="color:black; font-weight: bold;">명소전체</a>
			</c:if>
			<c:if test="${category eq 'l1'}">	
				<a style="color:black; font-weight: bold;">랜드마크</a>
			</c:if>
			<c:if test="${category eq 'l2'}">	
				<a style="color:black; font-weight: bold;">자연/공원</a>
			</c:if>
			<c:if test="${category eq 'l3'}">	
				<a style="color:black; font-weight: bold;">놀이동산</a>
			</c:if>
			<c:if test="${category eq 'l4'}">	
				<a style="color:black; font-weight: bold;">워터파크</a>
			</c:if>
			<c:if test="${category eq 'f'}">	
				<a style="color:black; font-weight: bold;">음식전체</a>
			</c:if>
			<c:if test="${category eq 'f1'}">	
				<a style="color:black; font-weight: bold;">식당</a>
			</c:if>
			<c:if test="${category eq 'f2'}">	
				<a style="color:black; font-weight: bold;">카페</a>
			</c:if>
			<c:if test="${category eq 'a'}">	
				<a style="color:black; font-weight: bold;">액티비티전체</a>
			</c:if>
			<c:if test="${category eq 'a1'}">	
				<a style="color:black; font-weight: bold;">스키/썰매</a>
			</c:if>
			<c:if test="${category eq 'a2'}">	
				<a style="color:black; font-weight: bold;">낚시</a>
			</c:if>
			<c:if test="${category eq 'a3'}">	
				<a style="color:black; font-weight: bold;">수상레저</a>
			</c:if>
			<c:if test="${category eq 'a4'}">	
				<a style="color:black; font-weight: bold;">바이크</a>
			</c:if>
			<c:if test="${category eq 'sh'}">	
				<a style="color:black; font-weight: bold;">가게전체</a>
			</c:if>
			<c:if test="${category eq 'sh1'}">	
				<a style="color:black; font-weight: bold;">특산품가게</a>
			</c:if>
			<c:if test="${category eq 'sh2'}">	
				<a style="color:black; font-weight: bold;">기념품가게</a>
			</c:if>
			<c:if test="${category eq 'sh3'}">	
				<a style="color:black; font-weight: bold;">의류가게</a>
			</c:if>
			<c:if test="${category eq 'sh4'}">	
				<a style="color:black; font-weight: bold;">스포츠가게</a>
			</c:if>
			
		</div>
		
		
		
		
		
		
		<!--검색 디자인 -->
		<style>
			#searchDiv{
				margin-top: 60px;
			}
			#searchInput{
				width:400px;
				outline: none;
				border: 1px solid #14A0A0;
				height: 40px;
			}
			/*플레이스홀더 색  */
			input::-ms-input-placeholder { color: #14A0A0; }
			input::-webkit-input-placeholder { color: #14A0A0; }
			input::-moz-placeholder { color: #14A0A0; }
			#searchBtn{
				height: 40px;
			}
		</style>
		
		<!--검색  -->
		<div id="searchDiv">
			<input type="text" id="searchInput" placeholder="키워드를 검색해주세요" >
			<button id="searchBtn" class="btn btn-outline-info"><i class="fas fa-search"></i>검색</button>
		</div>
		
		
		<!--돌아가기 버튼 디자인 -->
		<style>
			#backDiv{
				margin-top: 40px;
			}
		</style>
		
		<!--돌아가기 버튼  -->
		<div id="backDiv">
			<button class="btn btn-info">지역다시선택</button>
			<button class="btn btn-info">카테고리다시선택</button>
		</div>
		
		
		
		
		
			
		
		
		
		<!--정렬디자인  -->
		<style>
			#rangeDiv{
				margin-top: 80px;
				margin-left: 35px;
				
			}
			#rangeTable{
				border-bottom: 1px solid #c8c8c8;
				border-top: 1px solid #c8c8c8;
				
			}
			td{
				widht:40px;
				 font-size: 14px;
			}
			
			/*드롭다운 */
			.dropbtn {
				color: #828282;
				padding: 16px;
				  font-size: 14px;
				  border: none;
				background: #A7FAEB;
			}
				
				.dropdown {
				  position: relative;
				  display: inline-block;
				}
				
				.dropdown-content {
				  display: none;
				  position: absolute;
				  background-color: #f1f1f1;
				  min-width: 160px;
				  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
				  z-index: 1;
				}
				
				.dropdown-content a {
				  color: black;
				  padding: 12px 16px;
				  text-decoration: none;
				  display: block;
				}
				
				.dropdown-content a:hover {background-color: #ddd;}
				
				.dropdown:hover .dropdown-content {display: block;}
				
				.dropdown:hover .dropbtn {background-color: #969696; color:white;}
		</style>
		
		<!--정렬  -->
		<div id="rangeDiv">
			<table id="rangeTable">
				<tr>
					<td style="cursor: pointer; color:#0A6ECD; font-weight: bold;">&emsp;최신순 &emsp;</td>
					<td style="cursor: pointer;"> | &emsp;</td>
					<td style="cursor: pointer;">인기순 &emsp;</td>
					<td style="cursor: pointer;"> | &emsp;</td>
					<td style="cursor: pointer;"> 
						<div class="dropdown">
							<button class="dropbtn">리뷰순</button>
						    <div class="dropdown-content">
						    	<a href="#">전체</a>
						    	<a href="#">10대</a>
						    	<a href="#">20대</a>
						    	<a href="#">30대</a>
						    	<a href="#">40대</a>
						 	</div>
						 </div>
					</td>
					<td style="width:72.5%;"></td>
				</tr>
			</table>
		</div>
		
		
		
				
		<!--리스트 스타일  -->
		<style>
			.listdiv{
				position: relative;
				margin: 0px;
				margin-left:30px;
				margin-bottom:80px;
				top:30px;
				width:300px;
				float: left;
				height: 300px;
				border: 1px solid #D5D5D5;
				cursor: pointer;
			}
			.imgclass{
				position: relative;
			}
			.partner{
				position: absolute;
				top:0%;
				background: linear-gradient( to bottom, #27DBB7,#41aea9 );
				padding-right: 5px;
				padding-left: 5px;
				padding-top: 5px;
				padding-bottom: 5px;
				margin-left: 5px;
				font-size: 13px;
				color:white;
			}
			
		</style>
						
		<!--리스트-->
		<c:forEach items="${list }" var="map" varStatus="status">
			<div class="listdiv" onclick="list_onclick();">
				<img class="imgclass" alt="" src="${map.locationMain}" width="298px" height="200px;">
				<!--제휴업체 분기처리 시작 -->
				<c:if test="${map.locationStatus eq 1}">
				<div class="partner">제휴업체<br>예약가능</div>
				<!--제휴업체 분기처리 끝 -->
				</c:if>
				<p style="position:relative; font-weight:bold; font-size:20px; color:black; text-align: left; padding-left: 20px; height: 10px;"><c:out value="${map.locationTitle}" /></p>
				<p style="position:absolute; top:209px; left:210px; font-size:15px; text-align: right; height:15px; margin-top: 25px; padding-right: 20px;">조회수 ${map.viewCount}</p>
				<p style="font-size:15px; text-align: left; padding-left: 20px; padding-top:7px; height: 5px;"><i style="color: #FFC314;" class="fas fa-star"></i> ${map.review}(${map.reviewCount})</p>
				<p onclick="address_onclick();" style="cursor:pointer; font-size:12px; text-align: right; padding-right: 10px; background:#F8F8F8; margin-top:41px;"><i style= "color: #b4b4b4;" class="fas fa-map-marker-alt"></i>${map.locationAddress}</p>
			</div>
		</c:forEach>
		
				
				
		<!--div정리용 스타일 (무시)  -->
		<style>
     		div.clearfixed::after{display:block;content:"";clear:both}
		</style>
		<!--div정리용 (무시)  -->
		<div class="clearfixed"></div>
		
		
		
		
		
		
		  
		<!--쿠폰배너 스타일-->
		<style>
			#couponDiv{
				background: linear-gradient( to right, #41aea9, #27DBB7);
				margin-bottom: 30px;
				height: 70px;
				border-radius: 20px;
				cursor: pointer;
				padding-left: 100px;
				width:961px;
				margin-left:30px;
				margin-top:30px;
			}
		</style>
		
		<!--쿠폰배너  -->
		<div id="couponDiv" onclick="coupon();">
			<p style="font-size: 15px; color: white; padding-top:20px;"><b style="font-size: 17px;"><i class="fas fa-ticket-alt"></i> 쿠폰</b> 다운받으러 가기 <i class="fas fa-chevron-circle-right"></i></p>
		</div>	
		
		
		
				
		<!--페이징  -->
			<div id="navdiv"  style="margin-top: 30px;">
				<nav aria-label="Page navigation example">
			        <ul id="pageNavUl" class="pagination justify-content-center">
		     	       <c:out value="${pageBar }" escapeXml="false" />
		            </ul>
		        </nav>
	        </div>
         
         
         
         
         
         
         
         
       
           
            
	</div><!--locationListDiv닫기  -->
	


<script>
	/*쿠폰배너->이벤트페이지로 이동 */
	function coupon(){
		location.replace('${path }/event/eventList.do');
	}

	/*목록클릭 (view로 가는거)  */
	function list_onclick() {
		alert("리스트클릭");
		/* [고치기]리스트뷰로가기 */
	}

	/*주소p클릭  */
	function address_onclick() {
		event.stopPropagation();
		alert("주소클릭");
	}
</script>



</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>