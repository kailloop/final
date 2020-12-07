<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="title" />
</jsp:include>
<style>

h1{
  font-size: 30px;
  color: #fff;
  text-transform: uppercase;
  font-weight: 300;
  text-align: center;
  margin-bottom: 15px;
}
table{
  width:100%;
  table-layout: fixed;
}
.tbl-header{
  background-color: rgba(255,255,255,0.3);
 }
.tbl-content{
  height:300px;
  overflow-x:auto;
  margin-top: 0px;
  border: 1px solid rgba(255,255,255,0.3);
}
th{
  padding: 20px 15px;
  text-align: left;
  font-weight: 500;
  font-size: 12px;
  color: #fff;
  text-transform: uppercase;
}
td{
  padding: 15px;
  text-align: left;
  vertical-align:middle;
  font-weight: 300;
  font-size: 12px;
  color: #fff;
  border-bottom: solid 1px rgba(255,255,255,0.1);
}
section{
	display: none;
	
}

/* demo styles */

@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);
#tablejh{
  text-align : center;
  background: -webkit-linear-gradient(left, #8B4513, #F5D08A);
  background: linear-gradient(to right, #8B4513, #F5D08A);
  font-family: 'Roboto', sans-serif;
  width: 100%;
  height: 100%;
}
body{
background: -webkit-linear-gradient(left, #8B4513, #F5D08A);
  background: linear-gradient(to right, #8B4513, #F5D08A);
  font-family: 'Roboto', sans-serif;
  width: 100%;
  height: 100%;
}
.container{
	margin-top: 50px;
}

/* follow me template */
.made-with-love {
  margin-top: 40px;
  padding: 10px;
  clear: left;
  text-align: center;
  font-size: 10px;
  font-family: arial;
  color: #fff;
}
.made-with-love i {
  font-style: normal;
  color: #F50057;
  font-size: 14px;
  position: relative;
  top: 2px;
}
.made-with-love a {
  color: #fff;
  text-decoration: none;
}
.made-with-love a:hover {
  text-decoration: underline;
}


/* for custom scrollbar for webkit browser*/

::-webkit-scrollbar {
    width: 6px;
} 
::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
} 
::-webkit-scrollbar-thumb {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
}
td{
	cursor: pointer;
}


</style>
<jsp:include page="/WEB-INF/views/common/logo.jsp" />
</section>
<div id="tablejh"><h1>Notice</h1>
<div style="margin-left:50px; margin-right:50px;">
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0" class="text-center">
      <thead>
        <tr>
					<th class="text-center">No</th>
					<th class="text-center">작성자</th>
					<th class="text-center">제목</th>
					<th class="text-center">작성일</th>
					<th class="text-center">조회수</th>
				<tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table class="table-hover text-center" cellpadding="0" cellspacing="0" border="0">
     <c:forEach items="${list }" var="l">
					<tr class="jh_tr">
						<td class="text-center"><c:out value="${l.noticeNo }" /></td>
						<td class="text-center"><c:out value="${l.userId }" /></td>
						<td class="text-center"><c:out value="${l.noticeTitle }" /></td>
						<td class="text-center"><c:out value="${l.writeDate }" /></td>
						<td class="text-center"><c:out value="${l.viewCount }" /></td>
					</tr>
				</c:forEach>
    </tbody>
    </table>
    </div><br>
		<nav aria-label="Page navigation example" style="margin-bottom: 20px;">
                <ul id="pageNavUl" class="pagination justify-content-center">
                    <c:out value="${pageBar }" escapeXml="false" />
                </ul>
            </nav>
		<c:if test="${logginedMember!=null }"><c:if test="${logginedMember.id eq 'cccc'}"><button type="button" onclick="noticeWrite()">글쓰기</button></c:if></c:if>
		</div>
		</div>
<script>
	function noticeWrite() {
		console.log("${logginedMember.id eq 'cccc'}");
		if(${logginedMember!=null}){
			if(${logginedMember.id eq 'cccc'}){
				location.replace("${path}/notice/write");
			}else{
				alert("공지사항은 관리자만 작성이 가능합니다.");
			}
		}else{
			alert("공지사항은 관리자만 작성이 가능합니다.");
		}
	}
	$(function(){
		$(".jh_tr").click(e => {
			var jhval = $(e.target).parent().children().first().html();
			var jhurl = "${path}/notice/noticeView?noticeNo="+jhval; 
			location.href=jhurl;
		})
	});
	// '.tbl-content' consumed little space for vertical scrollbar, scrollbar width depend on browser/os/platfrom. Here calculate the scollbar width .
	$(window).on("load resize ", function() {
	  var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
	  $('.tbl-header').css({'padding-right':scrollWidth});
	}).resize();
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />