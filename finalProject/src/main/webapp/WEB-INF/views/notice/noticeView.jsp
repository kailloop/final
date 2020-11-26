<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="title" />
</jsp:include>
<% int cp = 0; %>
<style>
#logo {
	height: 900px;
	width: 100%;
	position: relative;
	z-index: 0;
	overflow: hidden;
}

#logo img {
	filter: grayscale(65%);
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
	width: 100%;
	height: 100%;
	z-index: -1;
}

#logo label {
	position: absolute;
	left: 27%;
	top: 35%;
	font-size: 120px;
	z-index: 0;
	cursor: pointer;
	font-family: Dancing Script;
	color: black;
}
</style>
<div id="logo">
	<img src="${path }/resources/images/notice.jpg" alt="notice" /> <label>Notice</label>
</div>
<section id="content" class="container" style="height: 500px;">
	<h1>
		<c:out value="${notice.userId}" />
		<c:out value="${notice.noticeTitle}" />
		<c:out value="${notice.writeDate}" />
		<c:out value="${notice.viewCount}" />
	</h1>
	<hr>
	<br>
	<div>
	<p class="float-left"><c:out value="${notice.userId}" /></p>
	<p class="float-right"><c:out value="${notice.writeDate}" /></p>
	</div>
	<br>
	<hr>
	<c:forEach var="file" items="${noticeFile}">
		<c:out value="${file.renameName }" />
		<a href="${path }/notice/fileDownload?fileName=${file.renameName}">다운로드</a>
		<br>
		<hr>
	</c:forEach>
	<br>
		<textarea rows="30" class="form-control" style="resize: none;" disabled readonly><c:out value="${notice.noticeTitle }"/></textarea>
	<br>
<%-- 	<c:if test="${noticeComment != null}"> --%>
		<div id="allCommentDiv">
				<%-- <c:forEach var="comment" items="${noticeComment}">
					<c:if test="${comment.replyPosition eq 0}">
						<c:if test="${noticeComment[0].commentPosition eq comment.commentPosition }">
							<div class="commentDiv">
						</c:if>
						<c:if test="${noticeComment[0].commentPosition ne comment.commentPosition }">
							</div>
							<div class="commentDiv">
						</c:if>
						<hr>
						<div id="inCommentDiv">
							<c:out value="${comment.userId }" />
							<textarea rows="" cols="" disabled readonly><c:out value="${comment.commentContent }"/></textarea>
							<c:out value="${comment.commentPosition }" />
							<c:out value="${comment.replyPosition }" />
							<c:out value="${comment.writeDate }" />
							<%cp++; %>
						</div>
					</c:if>
					<c:if test="${comment.replyPosition ne 0}">
						<div id="replyDiv" style="margin-left:50px;">
							<hr>
							<c:out value="${comment.userId }" />
							<textarea rows="" cols="" disabled readonly><c:out value="${comment.commentContent }"/></textarea>
							<c:out value="${comment.commentPosition }" />
							<c:out value="${comment.replyPosition }" />
							<c:out value="${comment.writeDate }" />
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
		<hr>
	</c:if> --%>
		${html }
		<h1><c:out value="${cp }"/></h1>
		
	</div>
	<form name="commentForm" id="formAddComment" action="${path }/notice/addComment">
		<div class="row">
			<div id="replyStatus"></div>
			<input id="jh-userId" type="hidden" name="userId" value="admin"/>
			<input id="jh-noticNo"type="hidden" name="noticeNo" value="${notice.noticeNo }"/>
			<input id="jh-replyPosition" type="hidden" name="replyPosition" value=""/>
			<input id="jh-commentPosition"type="hidden" name="commentPosition" value="${cp}"/>
			<textarea id="jh-commentContent" name="commentContent" class="form-control"
				style="width: 89%; resize: none; margin-left: 15px;" rows="4"></textarea>
			<button onclick="ajaxComment();" style="margin-left: 5px;"
				type="button" class="col-sm-1 btn btn-outline-secondary float-right">댓글작성</button>
		</div>
		<h1 id="cpH1"></h1>
	</form>
	<button type="button" onclick="deleteNotice();">삭제</button>
</section>
<script>

	function deleteNotice(){
		location.href = "${path}/notice/deleteNotice?noticeNo=${notice.noticeNo}";
	}

﻿/* 	setInterval(function(){
		ajaxComment();	
	}, 1000); */
	function addComment() {
		$("#formAddComment").submit();
	}
	function rollbackForm(ajaxCp){
		console.log("rollbackForm들어옴");
		console.log("jsonData.cp : "+ajaxCp);
		$("form div[id=replyStatus]").html("");
		$("form input[id=jh-commentPosition]").val(ajaxCp);
		$("form input[id=jh-replyPosition]").val("0");
	}

	$(function addbutton(){
		$("div[class=commentDiv]").on("mouseenter",function(){
			let hiddened = "<div style='height: 30px;'><button id='clicke' type='button' onclick='replywrite(event);' class='btn btn-outline-secondary float-right'>답글 작성</button></div>"
				$(this).children("#hiddened").html(hiddened);
			el = this;
			$("#clicke").click(function(){//스크롤 내려야함
		        var offset = $("#formAddComment").offset();
		        $('html, body').animate({scrollTop : offset.top}, 1000);
				});
		});
		$("div[class=commentDiv]").on("mouseleave",function(){
			let hiddeneds = "";
			$(this).children("#hiddened").html(hiddeneds);
		});
	});
	
	function replywrite(event){
		var form = document.commentForm;
		var commentP = $(event.target).parent().parent().parent().children("input[id=commentP]").val();
		var writerId =  $(event.target).parent().parent().parent().children("input[id=userId]").val();
		var replyP = "";
		
		
		/* console.log($(event.target));
		console.log($(event.target).parent());
		console.log($(event.target).parent().parent());
		console.log($(event.target).parent().parent().parent());
		console.log($(event.target).parent().parent().parent().children().last());
		console.log(); */
		if($(event.target).parent().parent().parent().children().last().children("input[id=replyP]").val()>0){
			replyP=parseInt($(event.target).parent().parent().parent().children().last().children("input[id=replyP]").val())+1;
/* 			console.log(replyP);
			console.log(parseInt(replyP)+1);
			*//* console.log("이프"); *//*
			console.log($(event.target).parent().parent().parent().children().last().children("input[id=replyP]").val()); */
			/* console.log("조건문 : "+$(event.target).parent().parent().parent().children().last().children("input[id=replyP]").val()); */
		}else{
			replyP = parseInt($(event.target).parent().parent().parent().children("input[id=replyP]").val())+1;
		/* 	console.log(replyP);
			console.log(parseInt(replyP)+1);
			*//* console.log("엘스"); 
			console.log("조건문 : "+$(event.target).parent().parent().parent().children().last().children("input[id=replyP]").val());
			console.log($(event.target).parent().parent().parent().children("input[id=replyP]")); */
		}
		/* $(form).children("#jh-commentPosition").val(commentP);
		$(form).children("#jh-replyPosition").val(replyP); */
		$("form input[id=jh-commentPosition]").val(commentP);
		$("form input[id=jh-replyPosition]").val(replyP);
		/* console.log("commentP : "+commentP);
		console.log("writerId : "+writerId);
		console.log("replyP : "+replyP); */
		$("form div[id=replyStatus]").html(writerId+"님에게 답글작성중입니다."+"<button  onclick='rollbackForm();' type='button'>취소</button>");
		
	}
	
	function ajaxComment(){
		
		var form = document.commentForm;
		var userId = form.userId.value;
		var noticeNo = form.noticeNo.value;
		var commentPosition = form.commentPosition.value;
		var commentContent = form.commentContent.value;
		var replyPosition = form.replyPosition.value;
		var jhData = {
				userId:userId,
				noticeNo:noticeNo,
				commentPosition:commentPosition,
				commentContent:commentContent,
				replyPosition:replyPosition
		};
		if(commentContent==""){
			alert("내용을입력해주세요.");
			return;
		}
		/* console.log(form);
		console.log(userId);
		console.log(noticeNo);
		console.log(commentPosition);
		console.log(commentContent); */
		
		
		/* $.post(
				"/couplism/notice/addCommentAjax",
				jhData,
				function(data){
					console.log(data);
					$("#allCommentDiv").html(data);
				},
				"html"
		); */
	 	/*  $.ajax({
			type : "post",
			url : "${path}/notice/addCommentAjax",
			data : jhData,
			dataType : "json"
		}).done(function(req){
			$("#allCommentDiv").html(req);
		}).fail(function(error){
			alert(JSON.stringify(error));
		});  */
		
		$.ajax({
			url:"${path}/notice/addCommentAjax",
			data:jhData,
			success:data => {
				var jsonData = JSON.parse(data);
				$("#allCommentDiv").html(jsonData.html);
				/* console.log("성공");
				console.log(jsonData.html);
				console.log(jsonData.cp); */
				console.log(jsonData.cp);
				console.log(data.cp);
				var ajaxCp = jsonData.cp;
				console.log(ajaxCp);
				/* $("form input[id=jh-commentPosition]").attr("value",jsonData.cp); */
				$("#jh-commentPosition").val(jsonData.cp);
				$("#jh-commentContent").val("");
				console.log($("form input[id=jh-commentPosition]"));
				/* $("form input[id=jh-commentPosition]").val(ajaxCp); */
				$("#cpH1").html(jsonData.cp);
				$(function addbutton(){
					$("div[class=commentDiv]").on("mouseenter",function(){
						let hiddened = "<div style='height: 30px;'><button id='clicke' type='button' onclick='replywrite(event);' class='btn btn-outline-secondary float-right'>답글 작성</button></div>"
							$(this).children("#hiddened").html(hiddened);
						el = this;
						$("#clicke").click(function(){//스크롤 내려야함
					        var offset = $("#formAddComment").offset();
					        $('html, body').animate({scrollTop : offset.top}, 1000);
							});
					});
					$("div[class=commentDiv]").on("mouseleave",function(){
						let hiddeneds = "";
						$(this).children("#hiddened").html(hiddeneds);
					});
				});
				rollbackForm(ajaxCp);				
>>>>>>> branch 'master' of https://github.com/kailloop/final.git
			},
			fail:error =>{
				alert(JSON.stringify(error));
			}  
		});
		
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />