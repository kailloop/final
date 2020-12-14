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
	#eventWriteDiv{
		margin-top: 90px;
		margin-left: auto;
		margin-right: auto;
	}
</style>


	<div id="eventWriteDiv">
		
		<!--글쓰기  스타일-->
		<style>
			#write{
				text-align: center;
			}
			table {
				width:800px;
				margin-left: auto;
				margin-right: auto;
				border-spacing: 15px;
  				border-collapse: separate;
			}
			td input {
				width: 500px;
				outline: none;
			}
			textarea {
				resize: none;
				width:500px;
				outline: none;
			}
		</style>
		<!--글쓰기  -->
			<div id="write">
			<form action="${path}/eventWriteEnd" name="eventForm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="admin" value="${logginedMember.id}">
				<table border="1">
					<tr>
						<td style="width: 100px;">제목</td>
						<td><input type="text" name="title" placeholder="제목을 입력해주세요"> </td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" placeholder="내용을 입력해주세요"></textarea> </td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td>
							<input type="file" id="imgpreview" name="img" onchange="readURL(this);" />
							<img id="preview" src="${path }/resources/images/white.jpg" alt="" width="500px;" height="300px;"/>
					    </td>
					</tr>
				</table>
				</form>	
			</div>
			
			
			<!--버튼  스타일-->
			<style>
				#btn{
					margin-top:50px;
					text-align: center;
				}
				
			</style>
			<!--버튼  -->
			<div id="btn">
				<button type="submit" class="btn btn-warning" onclick="enrollBtn();">등록</button>
				<button type="button" class="btn btn-outline-warning" onclick="cancelBtn();">취소</button>
			</div>
			
			
	
		</div><!-- eventWriteDiv닫기 -->
		


</section>

<script>

	function cancelBtn() {
	    if (confirm("작성하신 내용은 저장되지 않습니다. 정말 취소하시겠습니까??") == true){    //확인
	    	location.href="${path}/event/eventList.do";
	    }else{   //취소
	        return false;
	    }
	}
	
	function enrollBtn() {
		var title=$("[name=title]").val();
		if(title.trim().length==0){
			alert("제목을 입력해주세요");
			return false;
		}
	}
	
	
	$("#imgpreview").change(function(e){
		let files=e.target.files;
		let filesArr=Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자가 이미지 형태가 아닙니다.");
				return;
			}
			
			let reader=new FileReader();
			reader.onload=function(e){
				$("#preview").attr("src",e.target.result);
			}
			reader.readAsDataURL(f);
		});
	})
</script>
	
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>