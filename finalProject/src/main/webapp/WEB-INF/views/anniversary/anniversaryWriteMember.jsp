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
	#anniversaryWriteMember{
		margin-top: 80px;
		margin-left: auto;
		margin-right: auto;
		text-align: center;
	}
	#searchDiv{
		margin-top: 50px;
		margin-left: auto;
		margin-right: auto;
		text-align: center;
	}
	#lookList{
		margin-top: 50px;
		margin-left: auto;
		margin-right: auto;
		text-align: center;
	}
	td {
		cursor: pointer;
	}
</style>


	<div id="anniversaryWriteMember">
		<p>※일반회원은 명소등록만 가능합니다.</p>
		
		<div id="searchDiv">
			<select onchange="categoryChange(this)">
			    <option>대분류를 선택해주세요</option>
			    <option value="op1">서울특별시</option>
			    <option value="op2">경기도</option>
			    <option value="op3">인천광역시</option>
			    <option value="op4">강원도</option>
			    <option value="op5">제주특별자치도</option>
			    <option value="op6">대전광역시</option>
			    <option value="op7">부산광역시</option>
			    <option value="op8">대구광역시</option>
			    <option value="op9">전라도</option>
			    <option value="op10">경상도</option>
			    <option value="op11">충청도</option>
			</select>
			 
			<select id="smallCategroy">
				<option>소분류를 선택해주세요</option>
			</select>
			<br>
			<form>
				<input type="text">
				<button type="submit" class="btn btn-secondary">검색</button>
			</form>
		</div>
		
		
		<!--로케이션이 등록이 되어있을경우 -->
		<c:if test="${!empty lookList}">
			<!--사업장목록보여주는 리스트  -->
			<div id="lookList">
				
					
				<div id="listTable">
					<p style="font-size: 25px; color: black; height: 30px;">명소 목록 </p>
					<p>원하시는 명소 선택해주세요</p>
					<table id="listTable" class="table table-hover">
					    <tr class="active" style="border-bottom: 1px;">
				    	    <th>[명소]제목</th>
				          	<th>[명소]지역</th>
				        </tr>
			            <c:forEach var="lookList" items="${lookList }">
			            <tr onclick="location.replace('${path }/anniWriteDetail?locationNo=<c:out value="${lookList.locationNo }"/>')">
			            	<td><c:out value="${lookList.locationTitle }"/></td>
			            	<td><c:out value="${lookList.locationAddress }"/></td>
			            </tr>
			            </c:forEach>
			       	</table> 
				</div>
					
					<div id="pageBar">
			        	${pageBar }
			        </div>
			        
			        <div id="listBtn" style="text-align: center; margin-left: auto; margin-right: auto;">
		    			<button type="button" class="btn btn-secondary" onclick="location.href='${path }/anniversary/anniversarySearch.do'">목록으로</button>
		    		</div>
				</div><!--lookList닫기  -->
		    </c:if>   
			
			
			
			
			<!--로케이션 등록 안되어있을경우 --> 
			<c:if test="${empty lookList}">
				<div id="notEnroll" style="text-align: center;">
					<p style="font-size: 30px; margin-top: 70px;">등록된 명소가 없습니다. 명소를 먼저 등록 해주세요.</p>
					<button type="button" class="btn btn-secondary" onclick="">명소 등록하러가기</button>
				</div>
			</c:if>
		
		
		
		
		
		
	</div><!-- anniversaryWriteMember닫기 -->
	
 

	

</section>

<script>

function categoryChange(e) {
    var op1 = ["서울전체", "도봉구/강북구/노원구", "동대문구/중랑구/성북구", "강동구/송파구", "광진구/성동구", "종로구/중구/용산구", "은평구/서대문구/마포구", "강남구/서초구", "동작구/관악구/금천구", "영등포구/구로구", "양천구/강서구"];
    var op2 = ["경기전체", "가평/청평/양평", "수원/화성/동탄", "고양/파주/김포", "의정부/포천/동두천/연천", "용인", "오산/평택", "남양주/구리/성남/분당", "이천/광주/여주/하남", "부천/광명/시흥/안산", "안양/의왕/군포"];
    var op3 = ["인천전체", "부평(동암)", "구월/간석/소래/만수", "서구(석남,서구청,검단)", "계양(작전,경인교대)", "주안/옹진/용현/숭의/도화", "송도/연수", "중구(인천공항/을왕리/월미도/차이나타운/신포/동인천)", "강화", "동구"];
    var op4 = ["강원전체", "춘천/강촌/교동", "원주", "경포대/사천/주문진/정동진/강릉역/옥계", "영월/정선", "속초/양양/고성", "동해/삼척/태백", "평창", "홍천/횡성", "루나", "화천/철원/인제/양구"];
    var op5 = ["제주전체", "제주시", "서귀포시"];
    var op6 = ["대전전체", "유성구", "중구(은행/대흥/선화/유천)", "동구(용전/복합터미널)", "서구(둔산/용문/월평)", "대덕구(중리/신탄진)"];
    var op7 = ["부산전체", "해운대/센텀시티/재송", "송정/김해공항/신호/지사/명지/기장/정관", "광안리/수영", "경성대/대연/용호동/문현", "서면/양정/초읍/부산시민공원", "남포동/중앙동/태종대/영도/송도", "부산역/범일동/부산진역", "연산/토곡", "동래/사직/부산대/구서", "사상(경전철)/엄궁/학장", "덕천/만덕/화명/구포(구포역/KTX역)", "하단/다대포/괴정"];
    var op8 = ["대구전체", "동성로/서문시장/대구시청/삼덕동/교동/종로", "대구역/칠성시장/경북대/엑스코/칠곡지구/태전동/금호지구", "동대구역/고속버스터미널/신천동/신암동/대구공항/혁신도시/동촌유원지/팔공산", "수성못/들안길/황금/두산/범어/시지/라이온즈파크/월드컵경기장", "북부정류장/이현공단/평리동/내당동/비산동/원대동", "앞산공원/안지랑이천동/봉덕/서부정류장", "광장코아/본리/죽전/장기동/성당동/대명/두류공원/계명대/성서공단/상인동", "달성군/가창/현풍/논공"];
    var op9 = ["전라도전체", "전주/완주", "군산", "익산", "남원/임실/순창/무주/진안/장수", "정읍/부안/김제/고창", "여수", "순천", "광양", "나주/함평/영광/장성", "목포/무안/영암/신안", "담양/곡성/화순/구례", "해남/완도/진도/강진/장흥/보성/고흥", "광주(상무지구/금호지구/유스퀘어/서구)", "광주(첨단지구/하남지구/송정역/광산구)", "광주(충장로/대인시장/국립아시아문화전당/동구/남구)", "광주(광주역/기아챔피언스필드/전대사거리/북구)"];
    var op10 = ["경상도전체", "포항(북구/남구)", "경주(보문단지/황리단길/불국사/양남/감포/안강)", "구미", "경산(영남대/대구대/갓바위/하양/진량/자인)", "안동(경북도청/하회마을)", "영천/청도", "김천/칠곡/성주", "문경/상주/영주/예천/군위/의성/봉화", "울진/영덕/청송", "울릉도", "창원(상남동/용호동/중앙동/창원시청)", "김해/장유", "양산/밀양", "진주", "거제/통영/고성", "사천/남해", "하동/산청/함양", "거창/함안/창녕/합천/의령", "울산광역시(남구/중구)", "울산광역시(동구/북구/울주군)"];
    var op11 = ["충청도전체", "청주(흥덕구/서원구/상당구/청원구)", "충주/수안보", "제천/진천/음성/단양", "보은/옥천/괴산/증평/영동", "천안 서북구/동남구", "아산", "공주/동학사", "세종", "계룡/금산/논산/청양", "예산/홍성", "태안/안면도/서산", "당진", "보령/대천해수욕장", "서천/부여"];
    var target = document.getElementById("smallCategroy");
 	
    if(e.value == "op1") var d = op1;
    else if(e.value == "op2") var d = op2;
    else if(e.value == "op3") var d = op3;
    else if(e.value == "op4") var d = op4;
    else if(e.value == "op5") var d = op5;
    else if(e.value == "op6") var d = op6;
    else if(e.value == "op7") var d = op7;
    else if(e.value == "op8") var d = op8;
    else if(e.value == "op9") var d = op9;
    else if(e.value == "op10") var d = op10;
    else if(e.value == "op11") var d = op11;
    
    target.options.length = 0;
 
    for (x in d) {
        var opt = document.createElement("option");
        opt.value = d[x];
        opt.innerHTML = d[x];
        target.appendChild(opt);
    }    
}
	
</script>
	
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>