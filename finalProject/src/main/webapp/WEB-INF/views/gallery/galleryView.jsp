<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=" " />
</jsp:include>
<link rel="stylesheet" href="${path }/resources/css/animate.css">  
<link rel="stylesheet" href="${path }/resources/css/style.css">

<style>
	#logo{
		height:600px;
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
		left:35%;
		top:75%;
		font-size:80px;
		z-index:0;
		cursor:pointer;
		font-family:Dancing Script;
		color:black;
	}
</style>


<div id="logo">
	<img src="${path }/resources/images/gallery6.jpg" alt="로고1">
	<!-- <label>Gallery Write</label>  -->
</div>

<style>
        *:focus { outline:none; }
        body {
        }
        #contenttable {
            border-collapse: separate;
            border-spacing: 0 30px;
        }
       	
       	/*하트버튼*/
		fa-heart-o {
			color: red;
			cursor: pointer;
			
		}
		.fa-heart {
			color: red;
			cursor: pointer;
		}
		/*하트버튼끝*/
		        
    </style>

	<section id="content">
		 <table style="margin-left: auto; margin-right: auto; margin-top: 50px;">
        
        

        <!-- 제목,작성자,내용,첨부파일 -->
        <tr>
            <td colspan="2">
            	
                <table id="contenttable" width="500px">
                    <tr>
                        <td colspan="2" style="background: #D5D5D5; font-size: 25px;" >
                        	<c:out value="${gallery.galleryTitle }"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        	<c:out value="${gallery.galleryWriter }"/>
                        </td>
                        <td style="text-align: right;">
                        	<c:out value="${gallery.galleryDate}"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                        	<c:out value="${gallery.galleryContent}"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                        	사진자리다
                        	
						
                        </td>
                    </tr>
                   <!-- 하트버튼 -->
                   <tr>
                        <td colspan="2" style="text-align: center;">
                        	
                        	<span id = heart><i class="fa fa-heart-o fa-3x" aria-hidden="true" ></i> </span>
						
                        </td>
                    </tr>
                    <!-- 댓글 -->
                    <tr>
                        <td colspan="2">댓글자리다</td>
                    </tr>
                    
                </table>
            </td>
        </tr>

        <!-- 목록,수정,삭제버튼 -->
        <tr>
            <td style="text-align: left;">
                <input type="button" id="listbtn" class="btn btn-outline-secondary" value="목록" onclick="location.href='${path}/gallery/galleryList.do'">
                <!-- <a href=""><i class="fas fa-bars"></i>&nbspL i s t</a> -->
                
            </td>
            <td style="text-align: right;">
                <input type="button" id="deletebtn" class="btn btn-outline-danger" value="삭제" onclick="deleteBtn();">
                <input type="button" id="updatebtn" class="btn btn-outline-info" value="수정" onclick="">
            </td>
        </tr>
      
        
      </table>
		
	<script>
	//하트버튼
	$(document).ready(function(){
		$("#heart").click(function(){
			if($("#heart").hasClass("liked")){
				$("#heart").html('<i class="fa fa-heart-o fa-3x" aria-hidden="true"></i>');
			    $("#heart").removeClass("liked");
			}else{
			    $("#heart").html('<i class="fa fa-heart fa-3x" aria-hidden="true"></i>');
			    $("#heart").addClass("liked");
			}
		});
	});
	 
	 
	 
	function deleteBtn(){
		if(confirm("삭제하면 복구할 수 없습니다. 정말 삭제하시겠습니까?")){ 
			location.replace('${path}/gallery/galleryDelete.do?no=${gallery.galleryNo }');
		}
	}
	</script>
	</section>
	
