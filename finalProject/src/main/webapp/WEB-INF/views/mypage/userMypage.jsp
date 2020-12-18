<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="마이페이지" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>
<style>
	.inner{
		position:relative;
		width:80%;
		margin-left:auto;
		margin-right:auto;
	}
*, *:before, *:after {
      -moz-box-sizing: border-box;
      -webkit-box-sizing: border-box;
      box-sizing: border-box;
   }
/* Type */
   em, i {
      font-style: italic;
   }
   p {
      margin: 0 0 2em 0;
      color:#5D5D5D;
   }
   h2, h3{
      font-weight: 300;
      line-height: 1em;
      margin: 0 0 1em 0;
      text-transform: uppercase;
   }
   h2 a, h3 a{
      color: inherit;
      text-decoration: none;
   }

   h2 {
      font-size: 1.6em;
      line-height: 1.5em;
   }

   h3 {
      font-size: 1.2em;
      line-height: 1.5em;
   }

   h2, h3{
      color: #555;
   }


/* Section/Article */

   section.special, article.special, header.special {
      text-align: center;
   }

/* Feature */

   .features {
      display: -moz-flex;
      display: -webkit-flex;
      display: -ms-flex;
      display: flex;
      -moz-flex-wrap: wrap;
      -webkit-flex-wrap: wrap;
      -ms-flex-wrap: wrap;
      flex-wrap: wrap;
      -moz-justify-content: center;
      -webkit-justify-content: center;
      -ms-justify-content: center;
      justify-content: center;
      margin-bottom: 2em;
   }

   .feature {
      padding: 2em 2em 0.1em 2em;
      border-style: solid;
      border-width: 1px;
      margin-left: -1px;
      margin-top: -1px;
      width: 33.33333%;
      cursor:pointer;
   }

      .feature .fa {
         font-size: 2.8em;
         margin-bottom: 0.7em;
         color:#F26A8D;
      }
      .feature .far {
         font-size: 2.8em;
         margin-bottom: 0.7em;
         color:#F26A8D;
      }
      .feature .fas {
         font-size: 2.8em;
         margin-bottom: 0.7em;
         color:#F26A8D;
      }

      @media screen and (max-width: 1280px) {
         .feature {
            padding: 2em 1.5em 0.1em 1.5em;
         }
      }

      @media screen and (max-width: 736px) {
         .feature {
            padding: 2em 1em 0.1em 1em;
            width: 50%;
         }
      }

      @media screen and (max-width: 480px) {
         .feature {
            padding: 2em 0.5em 0.1em 0.5em;
            width: 100%;
         }
      }

   .feature {
      border-color: #e3e3e3;
   }


/* Wrapper */

   .wrapper {
      padding: 6em 0 4em 0;
      position: relative;
   }
      .wrapper > .inner {
         margin: 0 auto;
         width: 65em;
      }
         .wrapper > .inner.narrow {
            width: 35em;
         }

      @media screen and (max-width: 1280px) {
         .wrapper {
            padding: 5em 0 3em 0;
         }
            .wrapper > .inner {
               width: 60em;
            }
      }

      @media screen and (max-width: 980px) {
         .wrapper {
            padding: 4em 2em 2em 2em;
         }
            .wrapper > .inner {
               width: 100%;
            }
      }

      @media screen and (max-width: 736px) {
         .wrapper {
            padding: 3em 1.5em 1em 1.5em;
         }
            .wrapper > .inner.narrow {
               width: 80%;
            }
      }

      @media screen and (max-width: 480px) {
         .wrapper {
            padding: 2em 1em 0.1em 1em;
         }
            .wrapper > .inner.narrow {
               width: 100%;
            }
      }
</style>
	<form>
		<div class="inner" style="text-align:center;">
		<br>
		<h2>MY PAGE</h2>
		<br><br><br>
		<div class="features">			
			<!--일반회원  -->
			<c:if test="${logginedMember!=null }">
				<c:if test="${naverLogin==null }">
					<c:if test="${kakaoLogin==null }">
						<div class="feature" onclick="location.replace('${path }/faq/faqList.do');">	
							<i class="fas fa-user-cog"></i>
							<h3>회원정보수정</h3>
							<p>고객님의 개인정보를<br>수정하고 관리할 수 있습니다.</p>
						</div>
						<div class="feature">
							<i class="far fa-heart"></i>
							<h3>연인관리</h3>
							<p>상대방 아이디를 연인아이디로<br>관리할 수 있습니다.</p>
						</div>
						<div class="feature" onclick="location.replace('${path}/conponList?idvalue=<c:out value="${logginedMember.id }"/>')">
							<i class="fas fa-box-open"></i>
							<h3>쿠폰함</h3>
							<p>보유하고 계신 쿠폰을<br>확인, 관리할 수 있습니다.</p>
						</div>
						<div class="feature" onclick="location.replace('${path }/anniversary/myCalendar.do?idvalue=<c:out value="${logginedMember.id }"/>')">
							<i class="fas fa-calendar-alt"></i>
							<h3>캘린더</h3>
							<p>캘린더를 이용하실 수 있습니다.</p>
						</div>
						<div class="feature" onclick="location.replace('${path}/reservation?idvalue=<c:out value="${logginedMember.id }"/>')">
							<i class="fas fa-history"></i>
							<h3>예약내역</h3>
							<p>예약내역을 확인하실 수 있습니다.</p>
						</div>
					</c:if>
				</c:if>
			</c:if>
						
			<!--네이버회원  -->	
			<c:if test="${logginedMember!=null }">
				<c:if test="${naverLogin.email!=null }">
					<c:if test="${kakaoLogin==null }">
						<div class="feature" onclick="naver_update();">	
							<i class="fas fa-user-cog"></i>
							<h3>회원정보수정</h3>
							<p>고객님의 개인정보를<br>수정하고 관리할 수 있습니다.</p>
						</div> 
						<div class="feature">
							<i class="far fa-heart"></i>
							<h3>연인관리</h3>
							<p>상대방 아이디를 연인아이디로<br>관리할 수 있습니다.</p>
						</div>
						<div class="feature">
							<i class="fas fa-box-open"></i>
							<h3>쿠폰함</h3>
							<p>보유하고 계신 쿠폰을<br>확인, 관리할 수 있습니다.</p>
						</div>
						<div class="feature" onclick="location.replace('${path }/anniversary/myCalendar.do?idvalue=<c:out value="${logginedMember.email }"/>')">
							<i class="fas fa-calendar-alt"></i>
							<h3>캘린더</h3>
							<p>캘린더를 이용하실 수 있습니다.</p>
						</div>
						<div class="feature" onclick="location.replace('${path}/reservation?idvalue=<c:out value="${naverLogin.email }"/>')">
							<i class="fas fa-history"></i>
							<h3>예약내역</h3>
							<p>예약내역을 확인하실 수 있습니다.</p>
						</div>
					</c:if>
				</c:if>
			</c:if>
					
			<!--카카오회원  -->	
			<c:if test="${logginedMember!=null }">
				<c:if test="${naverLogin.email==null }">
					<c:if test="${kakaoLogin.email!=null }"> 
						<div class="feature" onclick="kakao_update();">	
							<i class="fas fa-user-cog"></i>
							<h3>회원정보수정</h3>
							<p>고객님의 개인정보를<br>수정하고 관리할 수 있습니다.</p>
						</div> 
						<div class="feature">
							<i class="far fa-heart"></i>
							<h3>연인관리</h3>
							<p>상대방 아이디를 연인아이디로<br>관리할 수 있습니다.</p>
						</div>
						<div class="feature">
							<i class="fas fa-box-open"></i>
							<h3>쿠폰함</h3>
							<p>보유하고 계신 쿠폰을<br>확인, 관리할 수 있습니다.</p>
						</div>
						<div class="feature" onclick="location.replace('${path }/anniversary/myCalendar.do?idvalue=<c:out value="${logginedMember.email }"/>')">
							<i class="fas fa-calendar-alt"></i>
							<h3>캘린더</h3>
							<p>캘린더를 이용하실 수 있습니다.</p>
						</div>
						<div class="feature" onclick="location.replace('${path}/reservation?idvalue=<c:out value="${kakaoLogin.email }"/>')">
							<i class="fas fa-history"></i>
							<h3>예약내역</h3>
							<p>예약내역을 확인하실 수 있습니다.</p>
						</div>
					</c:if>
				</c:if>
			</c:if>
						
						
						
						
						
						
		</div><!--features 닫기  -->
		</div><!--inner 닫기  -->
				
				<input type="hidden" value="<c:out value="${logginedMember.email }"/>">
		</form>	
</section>

<script>
	function naver_update() {
		alert("네이버회원은 회원정보수정을 하실 수 없습니다.");
	}
	function kakao_update(){
		alert("카카오회원은 회원정보수정을 하실 수 없습니다.")
	}
</script>
	
</body>
</html>


<script src="${path }/resources/js/skel.min.js"></script>
<script src="${path }/resources/js/util.js"></script>

<jsp:include page='/WEB-INF/views/common/footer.jsp'/>
