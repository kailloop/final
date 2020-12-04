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
	#logo{
		height:900px;
		width:100%;
		
	    position: relative;
	    z-index: 0;
	    overflow: hidden;
	}
	#logo img{
		filter: grayscale(65%);
		background-size: cover;
	    background-repeat: no-repeat;
	    background-position: center center;
		width:100%;
		height:100%;
		z-index:-1;
	}
	#logo label{
		position:absolute;
		left:27%;
		top:35%;
		font-size:120px;
		z-index:0;
		cursor:pointer;
		font-family:Dancing Script;
		color:black;
	}
</style>
	<div id="logo">
		<img src="${path }/resources/images/notice.jpg" alt="notice"/>
		<label>Notice</label> 
	</div>
<section>
	<div id="tableContainer" class="container">
		<table class="table table-hover">
			<thead class="thead-dark">
				<tr>
					<th>No</th>
					<th>작성자</th>
					<th>제목</th>
					<th>작성일</th>
					<th>조회수</th>
				<tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="l">
					<tr class="jh_tr">
						<td><c:out value="${l.noticeNo }" /></td>
						<td><c:out value="${l.userId }" /></td>
						<td><c:out value="${l.noticeTitle }" /></td>
						<td><c:out value="${l.writeDate }" /></td>
						<td><c:out value="${l.viewCount }" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav aria-label="Page navigation example" style="margin-bottom: 20px;">
                <ul id="pageNavUl" class="pagination justify-content-center">
                    <c:out value="${pageBar }" escapeXml="false" />
                </ul>
            </nav><button type="button" onclick="noticeWrite()">글쓰기</button>
		<c:if test="${logginedMember!=null }"><c:if test="${logginedMember.id eq 'cccc'}"></c:if></c:if>
	</div>
</section>
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
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />