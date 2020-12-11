<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>
<script type="text/javascript" src="${path }/resources/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="${path }/resources/ckeditor/contents.css">
<form class="form-horizontal" role="form" id="editorForm" method="post" action="${path }/getcheckCk">
    <div class="form-group">
        <div class="form-group">
            <div class="col-lg-12">
                <textarea name="ckeditor" id="ckeditor"></textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12" align="right">
                <button type="submit" class="btn btn-default">저장</button>
            </div>
        </div>
    </div>
</form>
 
<script>
    $(function(){
         
        CKEDITOR.replace( 'ckeditor', {//해당 이름으로 된 textarea에 에디터를 적용
            width:'100%',
            height:'400px',
            filebrowserImageUploadUrl: '${path}/community/imageUpload' //여기 경로로 파일을 전달하여 업로드 시킨다.
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
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>