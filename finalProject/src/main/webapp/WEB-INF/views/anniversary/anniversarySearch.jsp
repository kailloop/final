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
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>   -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  

<style>
	#search{
		margin-left: auto; 
		margin-right: auto;
		text-align: center;
		margin-top: 150px;
		border-radius: 10px;
	}
	#search_input{
		border: red 2px solid;   
		width:450px;
        height: 37px;
        font-size: 15px;
		outline-style: none;
		margin-right: 10px;
	}
	.inventory{
		width:350px;
		height:250px;
		position:relative;
		box-shadow:3px 3px 3px #A6A6A6;
		border-radius:10px;
		overflow:hidden;
		display:inline-block;
		margin:20px auto;
		margin-left:50px;
		cursor:pointer;
	}
	.img{
		width: 100%;
		height: 100%;
	}
	.text{
		position:absolute;
		color:yellow;
		width: 100%;
		height: 100%;
		margin-top: 30px;
	}
	
	.allow{
		width:50px;
		height:250px;
		position:relative;
		overflow:hidden;
		display:inline-block;
		margin:20px auto;
		margin-left:50px;
		cursor:pointer;
		
	}
	

</style>

<div id="search">
	<div class="search_view">
		<input type="text" id="search_input">
		<button type="button" id="search_btn" class="btn btn-outline-danger" ><i class="fas fa-search"></i></button>
		
				<!-- 
		<hr style="margin-right: 100px; margin-left:100px; margin-top: 40px;"> -->
	</div>
		
		<!-- <div class="list_view"> -->
	<p style="margin-top:100px;"><b style="color:red;"><i class="fas fa-fire-alt"></i>HOT</b> 키워드</p>	
		

	
	<style>
		ul {
		  list-style: none;
			}
		.slide {
		  position: relative;
		  padding-top: 50px;
		  overflow: hidden;
		  margin-left: auto;
		  margin-right: auto;
		}
		.panel {
		  width: 400%;
		}
		.panel:after {
		  content: "";
		  display: block;
		  clear: both;
		}
		.panel>li {
		  width: 25%;
		  height: 400px;
		  float: left;
		  background-repeat: no-repeat;
		  background-size: 100% 100%;
		  position: relative;
		}
		.dot:after {
		  content: "";
		  display: block;
		  clear: both;
		}
		.dot {
		  position: absolute;
		  left: 50%;
		  bottom: 10%;
		  transform: translateX(-50%);
		  font-size:5px;
		}
		.dot>li {
		  float: left;
		  width: 25px;
		  height: 25px;
		  border-radius: 50%;
		  background-color: #D5D5D5;
		  margin-left: 10px;
		  margin-right: 10px;
		  text-indent: -9999px;
		  cursor: pointer;
		}
		.dot>li.on {
		  background-color: red;
		}
		.prev {
		  position: absolute;
		  width: 50px;
		  height: 50px;
		  background-color: #fff;
		  top: 50%;
		  transform: translateY(-50%);
		  left: 10%;
		  cursor: pointer;
		}
		.next {
		  position: absolute;
		  width: 50px;
		  height: 50px;
		  background-color: #fff;
		  top: 50%;
		  transform: translateY(-50%);
		  right: 10%;
		  cursor: pointer;
		}
	</style>
	
	<div class="slide">
	  <ul class="panel">
	    <li>
			<div class="inventory">
				<img class="img" src="${path }/resources/images/anni/chris.png">
			</div>
			<div class="inventory">
				<img class="img" src="${path }/resources/images/anni/choco.jpg">
			</div>
			
		</li>
	    <li>
	    	<div class="inventory">
				<img class="img" src="${path }/resources/images/anni/ha.png" >
			
			</div>
			<div class="inventory">
				<img class="img" src="${path }/resources/images/anni/ro.jpg">
			</div>
		</li>
	  </ul>
	  <ul class="dot">
	    <li class="on">슬라이드 버튼1번</li>
	    <li>슬라이드 버튼2번</li>
	  </ul>
	  <div class="next"><i class="fas fa-angle-right"></i></div>
	  <div class="prev"><i class="fas fa-angle-left"></i></div>
	</div>
	
	
	<!--리스트 스타일  -->
	<style>
		#listDiv table td{
			cursor: pointer;
		}
	</style>
	<!--리스트  -->
	<div id="listDiv">
		<table id="listTable" class="table table-hover">
            <tr class="danger">
            	<th>기념일</th>
                <th>제목</th>
                <th>지역</th>
                <th>타입</th>
                <th>가격</th>
            </tr>
            <c:forEach var="anni" items="${list }">
            	<tr>
            		<td><c:out value="${anni.anniversaryType }"/></td>
            		<td>로케이션제목<c:out value="${anni.locationNo }"/></td>
            		<td>로케이션지역</td>
            		<td>로케이션타입</td>
            		<td><c:out value="${anni.anniversaryPrice }"/></td>
            	</tr>
            </c:forEach>
        </table> 
	</div>
	
	<div id="pageBar">
        	${pageBar }
    </div>
	
	
	
	<!--등록버튼-->
	<div id="btnDiv" style="text-align: right;">
		<!-- 로그인한아이디만 가능&제휴회원만 등록가능 분기처리-->
		<c:if test="${logginedMember!=null }">
			<c:if test="${naverLogin==null }">
					<c:if test="${kakaoLogin==null }">
						<c:if test="${partnerMember !=null}">
							<button type="button" class="btn btn-danger" onclick="location.href='${path }/anniWrite?userId=${logginedMember.id }'">기념일 설정</button>
						</c:if>
					</c:if>
				</c:if>
			</c:if>
		<!-- 로그인한아이디만 가능&일반회원만 등록가능 분기처리 -->
		<c:if test="${logginedMember!=null }">
					<c:if test="${naverLogin==null }">
						<c:if test="${kakaoLogin==null }">
							<c:if test="${partnerMember==null}">
		<button type="button" class="btn btn-danger" onclick="location.href='${path }/anniWriteMember?userId=${logginedMember.id }'">기념일 등록</button>
		</c:if>
		</c:if>
		</c:if>
		</c:if>
	</div>
	
		
</div>

		






		
</section>	
	

<script>
        $(function(){
        	
        	
        	$(document).ready(function() {
        		  slide();
        		});


        		// 슬라이드 
        		function slide() {
        		  var wid = 0;
        		  var now_num = 0;
        		  var slide_length = 0;
        		  var auto = null;
        		  var $dotli = $('.dot>li');
        		  var $panel = $('.panel');
        		  var $panelLi = $panel.children('li');

        		  // 변수 초기화
        		  function init() {
        		    wid = $('.slide').width();
        		    now_num = $('.dot>li.on').index();
        		    slide_length = $dotli.length;
        		  }

        		  // 이벤트 묶음
        		  function slideEvent() {

        		    // 슬라이드 하단 dot버튼 클릭했을때
        		    $dotli.click(function() {
        		      now_num = $(this).index();
        		      slideMove();
        		    });

        		    // 이후 버튼 클릭했을때
        		    $('.next').click(function() {
        		      nextChkPlay();
        		    });

        		    // 이전 버튼 클릭했을때
        		    $('.prev').click(function() {
        		      prevChkPlay();
        		    });

        		    // 오토플레이
        		    autoPlay();

        		    // 오토플레이 멈춤
        		    autoPlayStop();

        		    // 오토플레이 재시작
        		    autoPlayRestart();

        		    // 화면크기 재설정 되었을때
        		    resize();
        		  }

        		  // 자동실행 함수
        		  function autoPlay() {
        		    auto = setInterval(function() {
        		      nextChkPlay();
        		    }, 5000);
        		  }

        		  // 자동실행 멈춤
        		  function autoPlayStop() {
        		    $panelLi.mouseenter(function() {
        		      clearInterval(auto);
        		    });
        		  }


        		  // 자동실행 멈췄다가 재실행
        		  function autoPlayRestart() {
        		    $panelLi.mouseleave(function() {
        		      auto = setInterval(function() {
        		        nextChkPlay();
        		      }, 5000);
        		    });
        		  }

        		  // 이전 버튼 클릭시 조건 검사후 슬라이드 무브
        		  function prevChkPlay() {
        		    if (now_num == 0) {
        		      now_num = slide_length - 1;
        		    } else {
        		      now_num--;
        		    }
        		    slideMove();
        		  }

        		  // 이후 버튼 클릭시 조건 검사후 슬라이드 무브
        		  function nextChkPlay() {
        		    if (now_num == slide_length - 1) {
        		      now_num = 0;
        		    } else {
        		      now_num++;
        		    }
        		    slideMove();
        		  }

        		  // 슬라이드 무브
        		  function slideMove() {
        		    $panel.stop().animate({
        		      'margin-left': -wid * now_num
        		    });
        		    $dotli.removeClass('on');
        		    $dotli.eq(now_num).addClass('on');
        		  }

        		  // 화면크기 조정시 화면 재설정
        		  function resize() {
        		    $(window).resize(function() {
        		      init();
        		      $panel.css({
        		        'margin-left': -wid * now_num
        		      });
        		    });
        		  }
        		  init();
        		  slideEvent();
        		}
        });
</script>	
	
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>

