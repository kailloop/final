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
			background-color:white;
			margin: 0;
			padding: 0;
        }
        #menudiv {
			width:100%;
			height:110px;
			background-color:rgb(243, 243, 243);
		}
        .tableinput{
            /* margin-top: 5%;
            margin-left:20%; */
            margin-left: auto; margin-right: auto;
            margin-top:2%;
        }
        h3{
            text-align: center;
            margin-top: 3%;
        }
        textarea{
            resize: none;
            width:425px;
            height: 200px;
            font-size: 16px;
        }
        #texttitle{
            width:425px;
            height: 32px;
            font-size: 14px;
        }
        input::-webkit-input-placeholder { color: #D9418C}
        textarea::-webkit-input-placeholder { color: #D9418C}
        table {
            border-collapse: separate;
            border-spacing: 0 20px;
        }
        
        input[type=checkbox] { 
            display:none; 
        }
        input[type=checkbox] + label { 
            display: inline-block; 
            cursor: pointer; 
            line-height: 33px; 
            padding-left: 22px; 
            background: url('${path }/resources/images/heart.png') left/33px no-repeat; 
        }
        input[type=checkbox]:checked + label {
            background-image: url('${path }/resources/images/heartlike.png');
        }
        th{
            width:250px;
            text-align: left;
            font-size:16px;
        }


  
    </style>

<section id="content">
	<div id="inputdiv" >
            <h3><img src="" alt=""> Gallery Write</h3>
            
         <form action="${path}/gallery/galleryWriteEnd.do" method="post" enctype="multipart/form-data" name="inputform">
        <table class="tableinput" width="650">
            <tr>
                <th>제 목 </th>
                <td>
                    <input type="text" name="galleryTitle" id="texttitle" placeholder="제목을 입력해주세요."/>
                </td>
            </tr>
             <tr>
                <th>작 성 자 </th>
                <td>
                    <input type="text" name="galleryWriter" id="textwriter" value="${gallery.galleryNo }" required/>
                </td>
            </tr>
            <tr>
                <th>공 개 여 부 </th>
                <td>
                    <input type="checkbox" class="class_checkbox"id="checkbox1" onclick="check_only(this);" name=openStatus value="Y" checked="checked">
                    <label for="checkbox1">&nbsp&nbsp&nbsp공개</label>
                    &nbsp&nbsp&nbsp&nbsp
                    <input type="checkbox" class="class_checkbox" id="checkbox2" onclick="check_only(this);" name=openStatus value="N">
                    <label for="checkbox2">&nbsp&nbsp&nbsp비공개</label>
            
                </td>
            </tr>
            <tr>
                <th style="vertical-align: top;">내 용 </th>
                <td>
                    <textarea name="galleryContent" rows="5" cols="50" id="contentarea"placeholder="내용을 입력해주세요."></textarea>
                </td>
            </tr>
            <tr>
                <th scope="col">사진첨부</th>
                <td>
                    <table width="100%" border="0" id='insertTable'>
                        <tr>
                            
                            <td width="77%">
                            
                            
					                            
					        	<div id="div-container-file">
									<div class="input-group mb-3">
									  
										<div class="custom-file">
									    	<input name="files" type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
									    	<label class="custom-file-label" for="inputGroupFile01">여기를 클릭하여 파일을 선택하세요.</label>
									  	</div>
									  	
									    <button id="addInputFile" style="width:60px;" type="button">+</button>
									</div>
								</div>
                            
                            
                            
                            
                            </td>
                            
                        </tr>
                    </table>
                </td>
            </tr>
            </tr>
            <tr>
<!--            <td style="text-align: left;">
                    <input type="reset" id="resetbtn" class="btn btn-outline-secondary" value="초기화" />
                </td> -->
                <td colspan="2" style="text-align: center;">
                    <input type="button" id="cancelbtn" value="취  소" class="btn btn-outline-secondary" onClick="cancelbutton();"/>
                    &nbsp
                    <input type="submit" id="enrollbtn" value="등  록" class="btn btn-outline-danger" onclick="inputbutton()" /> 
                </td>
            </tr>
        </table>
        </form> 
    </div>
    
    <script>
    	//체크박스 중복x
	    function check_only(chk){
	        var obj = document.getElementsByClassName("class_checkbox");
	        for(var i=0;i<obj.length;i++){
	            if(obj[i]!=chk){
	                obj[i].checked=false;
	            }
	        }
	    }
    	//취소팝업창
    	function cancelbutton() {
            if (confirm("작성하신 내용은 저장되지 않습니다. 정말 취소하시겠습니까??") == true){    //확인
                
                location.href='${path}/gallery/galleryList.do';
            }else{   //취소
                return false;
            }
        }
    	
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
					$("#div-container-file").append("<div class='input-group mb-3'><div class='custom-file'><input name='files' onchange='changeFile(event);' type='file' class='custom-file-input' id='inputGroupFile01' aria-describedby='inputGroupFileAddon01'><label class='custom-file-label' for='inputGroupFile01'>여기를 클릭하여 파일을 선택하세요.</label></div><button onclick='deleteInputFile(event);' type='button' style='width:60px;''>삭제</button></div>");
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