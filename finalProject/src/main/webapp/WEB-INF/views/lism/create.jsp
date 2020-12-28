<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&display=swap" rel="stylesheet">
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>
<style>
	section{
		height:1200px;
		text-align:center;
	}
	#page-title{
		position:relative;
		margin-right:auto;
		margin-left:auto;
		font-family: 'Dancing Script', cursive;
		font-size:102px;
		color:black;
	}
	#lism-title{
		position:relative;
		margin-left:auto;
		margin-right:auto;
		top:-10px;
		width:50%;
		height:60px;
		border:none;
		border:none;
		text-align:center;
	}
	#lism-title-date{
		position:relative;
		margin-left:auto;
		margin-right:auto;
		top:-10px;
		width:50%;
		height:60px;
		border:none;
		border:none;
		text-align:center;
	}
	.lism-input{
		position:relative;
		outline:none;
		width:100%;
		height:100%;
		border:none;
		border-bottom:3px gray solid;
		transition:0.5s;
		font-size:36px;
		background-color:transparent;
		font-family: 'Hi Melody', cursive;
	}
	.lism-name{
		position:relative;
		font-family: 'Hi Melody', cursive;
		font-size:42px;
		left:25%;
		top:30px;
		height:50px;
		color:black;
		transition:0.7s;
	}
	#focus-one{
		position:relative;
		width:40%;
		height:500px;
		border:2px black solid;
		z-index:1;
	}
	#focus-two{
		position:relative;
		width:40%;
		height:500px;
		left:60%;
		top:-500px;
		border:2px black solid;
		z-index:1;
	}
	.focus{
		transition:0.5s;
	}
	.handle{
		position:relative;
		width:50%;
		top:-6.5%;
		height:300px;
		margin-left:auto;
		margin-right:auto;
		border:1px red solid;
		border-radius:20px;
		overflow:hidden;
	}
	.handle > img{
		position:relative;
		width:100%;
		height:100%;
		cursor:pointer;
		float:left;
	}
	.slideFont{
		font-size:62px;
		color:black;
		cursor:pointer;
	}
	#angle-left{
		position:relative;
		top:180px;
	}
	#angle-right{
		position:relative;
		left:86%;
		top:180px;
	}
	
	#reservation-date{
		position:relative;
		width:20%;
	}
	#focus-three{
		position:relative;
		top:-790px;
		color:black;
		z-index:0;
		width:68px;
		height:68px;
		margin-left:auto;
		margin-right:auto;
		transition:0.5s;
		cursor:pointer;
	}
	#plus{
		position:relative;
		cursor:pointer;
		top:-36px;
	}
	#picker-table{
		width:100%;
		height:100%;
	}
</style>
	<label id="page-title">Couplism</label>
	<form action="/lism/createEnd" method="post" style="text-align:left;">
		<label class="lism-name">제목</label>
		<br/>
		<div id="lism-title">
			<input class="lism-input" maxlength="30" name="title" id="title" type="text" autocomplete="off">
		</div>
		<br/>
		<div id="lism-title-date" style="text-align:center;">
			<input class="lism-input" id="lism-date" name="lismDate"type="date" style="width:27.5%;" onchange="selectDate();">
		</div>
		<br/>
		<div id="focus-one" class="focus">
			<table id="picker-table">
				<tr class="focus-title">
					<td>
						<i class="fas fa-pencil-alt"></i>
					</td>
				</tr>
				<tr class="focus-content">
					
				</tr>
			</table>
			
			<label>${logginedMember.id }</label>
		</div>
		<div id="focus-two" class="focus">
				<label id="angle-left" class="slideFont">〈</label>
				<label id="angle-right" class="slideFont">〉</label>
			<div class="handle">
				
			</div>
			
		</div>
		<div id="focus-three" style="text-align:center;font-size:72px;">
			<i id="plus"class="far fa-plus-square"></i>
		</div>
	</form>
	<script>
		var count=1;
		$("#focus-three").click(function(e){
			var value=$("#pickerNo"+count).val();
			$.ajax({
				url:"${path}/lism/getLocationMain",
				data:{"parseData":value},
				dataType:"html",
				success:data=>{
					//
				}
			})
		});
		$("#focus-three").hover(function(e){
			$("#focus-three").css("color","#F26A8D");
		},function(e){
			$("#focus-three").css("color","black");
		});
	</script>
	<script>
		function selectDate(){
			$.ajax({
				url:"${path}/lism/selectDate",
				data:{"lismDate":$("#lism-date").val()},
				dataType:"html",
				success:data=>{
					var parseData = JSON.parse(data);
					console.log(parseData);
					for(var i=0;i<parseData.length;i++){
						$.ajax({
							url:"${path}/lism/getLocationMain",
							data:{"parseData":parseData[i].locationNo},
							dataType:"html",
							success:data=>{
								console.log("분류");
								console.log(data);
								$(".handle").append("<img id=picker"+i+" class='pickerImg"+i+"' src='${path}/resources/upload/locationMain/'"+data+"' alt='메인'>");
								$(".handle").append("<input type='hidden' id='pickerNo"+i+"' value='"+locationNo+"'");
							}
						});
						console.log(parseData[i]);
					}
					
				}
			});
		}
		$(".pickerImg").click(function(e){
			console.log("보통");
		})
		$(".lism-input").focus(function(e){
			$(e.target).css("border-bottom","3px #F26A8D solid");
		});
		$(".lism-input").blur(function(e){
			$(e.target).css("border-bottom","3px gray solid");
		});
		
		
		$("#lism-title").children('input').focus(function(e){
			$(".lism-name").css("top","20px");
			$(".lism-name").css("font-size","16px");
			$(".lism-name").css("color","#F26A8D");
		});
		$("#lism-title").children('input').blur(function(e){
			var title=$("#title").val();
			$(e.target).css("border-bottom","3px #F26A8D solid");
			if(title==""){
				$(".lism-name").css("top","30px");
				$(".lism-name").css("font-size","42px");
				$(".lism-name").css("color","black");
				$(e.target).css("border-bottom","3px black solid");
				return;
			}
		});
	</script>
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>