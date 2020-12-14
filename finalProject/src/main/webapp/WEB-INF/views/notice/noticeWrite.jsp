<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>
<script type="text/javascript" src="${path }/resources/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="${path }/resources/ckeditor/contents.css">
	<div class="container" style="background: red; margin-top:100px;">
		<form action="${path }/notice/writeEnd" method="post" enctype="multipart/form-data">
			<input type="text" name="noticeTitle" placeholder="제목" style="width: 100%;">
			<div id="div-container-file">
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroupFileAddon01">파일</span>
				  </div>
				  <div class="custom-file">
				    <input name="noticeFile" type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
				    <label class="custom-file-label" for="inputGroupFile01">여기를 클릭하여 파일을 선택하세요.</label>
				  </div>
				  <button id="addInputFile" style="width:80px;" type="button">+</button>
				</div>
			</div>
        <div class="form-group">
            <div class="col-lg-12">
                <textarea name="noticeContent" id="noticeContent" style="resize: none;"></textarea>
            </div>
        </div>
			<input type="hidden" name="userId" value="${logginedMember.id}">
			<button class="float-right" type="submit">작성</button>
		</form>
		
	</div>
	
	<script>
	$(function(){
        
        CKEDITOR.replace( 'noticeContent', {//해당 이름으로 된 textarea에 에디터를 적용
            width:'100%',
            height:'400px',
            filebrowserImageUploadUrl: '${path}/notice/imageUpload?creator=${logginedMember.id}' //여기 경로로 파일을 전달하여 업로드 시킨다.
        });
         
         
        CKEDITOR.on('dialogDefinition', function( ev ){
            var dialogName = ev.data.name;
            var dialogDefinition = ev.data.definition;
          
            switch (dialogName) {
                case 'image': //Image Properties dialog
                    //dialogDefinition.removeContents('info');
                    dialogDefinition.removeContents('Link');
                    dialogDefinition.removeContents('advanced');
                    break;
            }
        });
         
    });

		var filecount = 1;
		$(function(){
			$('[name=noticeFile]').change(e => {
				var file = $(e.target)[0].files[0];
				if(file!=null){
					$(e.target).next(".custom-file-label").html(file.name);
				}else{
					console.log(file);
					$(e.target).next(".custom-file-label").html("여기를 클릭하여 파일을 선택하세요.");
				}
			})
		});
		$(function(){
			$('#addInputFile').click(e => {
				if(filecount < 5){
					$("#div-container-file").append("<div class='input-group mb-3'><div class='input-group-prepend'><span class='input-group-text' id='inputGroupFileAddon01'>파일</span></div><div class='custom-file'><input name='noticeFile' onchange='changeFile(event);' type='file' class='custom-file-input' id='inputGroupFile01' aria-describedby='inputGroupFileAddon01'><label class='custom-file-label' for='inputGroupFile01'>여기를 클릭하여 파일을 선택하세요.</label></div><button onclick='deleteInputFile(event);' type='button' style='width:80px;''>삭제</button></div>");
					filecount++;
				}
			})
		});
		function deleteInputFile(event){
			$(event.target).parent().remove();
			filecount--;
		}
		function changeFile(event){
			var file = $(event.target)[0].files[0];
			if(file!=null){
				$(event.target).next(".custom-file-label").html(file.name);
			}else{
				console.log(file);
				$(event.target).next(".custom-file-label").html("여기를 클릭하여 파일을 선택하세요.");
			}
		}
	</script>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />