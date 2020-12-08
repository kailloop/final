<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<style>
   #logo{
      height:1000px;
      width:100%;
       position: relative;
       z-index: 0;
       overflow: hidden;
   }
   #logo img{
      background-size: cover;
      background-repeat: no-repeat;
      background-position: center center;
      width:100%;
      height:100%;
      z-index:-1;
      transition:1s;
      transform:scale(1.1);
   }
   .main-label-eng{
      position:relative;
      font-size:75px;
      z-index:0;
      cursor:default;
      font-family: 'Montserrat', sans-serif;
      color:#F6F6F6;
      top:-620px;
      font-weight:lighter;
      transition:1s;
      opacity:0;
   }
   .main-label-han{
      position:relative;
      font-size:26px;
      z-index:0;
      cursor:default;
      font-family:Nanum Gothic Coding;
      color:#F6F6F6;
      top:-570px;
      transition:1s;
      opacity:0;
   }
   #border-bottom{
      font-size:20px;
      border-bottom:3px white solid;
      position:relative;
      z-index:0;
      cursor:default;
      font-family:Nanum Gothic Coding;
      color:#F6F6F6;
      top:-670px;
      transition:1s;
      opacity:0;
   }
   section{
      z-index:1;
      position:relative;
      width:90%;
      min-height:800px;
      top:-150px;
      margin:0;
      padding:0;
      margin-left:auto;
      margin-right:auto;
      background:white;
      overflow:hidden;
   }
   #down-scroll{
      position:relative;
      cursor:pointer;
      width:80px;
      height:80px;
      margin:0;
      padding:0;
      margin-left:auto;
      margin-right:auto;
      background:transparent;
      top:-635px;
      border:none;
      z-index:2;
      transition:1s;
   }
   #up{
      position:relative;
      cursor:pointer;
      width:0%;
      height:1px;
      margin:0;
      padding:0;
      left:0px;
      top:0px;
      border-top:1px white solid;
      transition:0.2s;
   }
   #down{
      position:relative;
      cursor:pointer;
      width:0%;
      height:1px;
      margin:0;
      padding:0;
      left:100%;
      bottom:0px;
      border-bottom:1px white solid;
      transition:0.2s;
   }
   #left{
      position:relative;
      cursor:pointer;
      width:1px;
      height:0%;
      margin:0;
      padding:0;
      left:0px;
      top:0px;
      border-left:1px white solid;
      transition:0.2s;
   }
   #right{
      position:relative;
      cursor:pointer;
      width:1px;
      height:0%;
      margin:0;
      padding:0;
      top:0px;
      left:100%;
      border-right:1px white solid;
      transition:0.2s;
   }
   #down-arrow{
      cursor:pointer;
      position:absolute;
      z-index:3;
      width:25px;
      padding:0;
      font-size:30px;
      margin:0;
      margin-left:auto;
      margin-right:auto;
      color:white;
      top:10px;
      left:28px;
   }
   #type-select{
      width:70%;
      height:200px;
      position:relative;
      z-index:1;
      margin:0;
      margin-left:auto;
      margin-right:auto;
      padding:0;
      color:lightgray;
      font-family:Nanum Gothic Coding;
      font-weight:bolder;
      font-size:64px;
   }
</style>
<script>
   $(function(){
      $("#up").css("width","102%");
      setTimeout(function(){
         $("#right").css("height","102%");
      },200);
      setTimeout(function(){
         $("#down").css("left","0%");
         $("#down").css("width","102%");
      },400);
      setTimeout(function(){
         $("#left").css("top","-83px");
         $("#left").css("height","104%");
      },600);
      $("#down-scroll").click(function(){//스크롤 내려야함
           var offset = $("section").offset();
           $('html, body').animate({scrollTop : offset.top}, 1000);
      });
      $("#down-scroll").hover(function(){
         $("#down-scroll").css("opacity","0.5");
      },function(){
         $("#down-scroll").css("opacity","1");
      });
      $(".enrollPartner").click(function(){
         $(".enrollPartner").css("color","#F26A8D");
         $(".enrollUser").css("color","lightgray");
         $(".enrollPartner").animate({
            borderLeftWidth : '100%'
         },1000);
      });
      $(".enrollUser").click(function(){
         $(".enrollPartner").css("color","lightgray");
         $(".enrollUser").css("color","#F26A8D");
      });
      
   });
   setInterval(function(){      
      setTimeout(function(){
         $("#left").css("top","0px");
         $("#left").css("height","0%");
      },200);
      setTimeout(function(){
         $("#down").css("left","100%");
         $("#down").css("width","0%");
      },400);
      setTimeout(function(){
         $("#right").css("height","0%");
      },600);
      setTimeout(function(){//사라짐
         $("#up").css("width","0%");
      },800);
      setTimeout(function(){//다시 나타남
         $("#up").css("width","102%");
      },1000);
      setTimeout(function(){
         $("#right").css("height","102%");
      },1200);
      setTimeout(function(){
         $("#down").css("left","0%");
         $("#down").css("width","102%");
      },1400);
      setTimeout(function(){
         $("#left").css("top","-83px");
         $("#left").css("height","104%");
      },1600);
   },5000);
   $(function(){
      $(".main-label-han").css("top","-600px");
      $(".main-label-han").delay(1000).css("opacity","1");
      $("#logo-img").css("transform","scale(1.0)");
      
   });
   setTimeout(function() {
      $(".main-label-eng").css("top","-650px");
      $(".main-label-eng").css("opacity","1");
      $("#border-bottom").css("top","-700px");
      $("#border-bottom").delay(1000).css("opacity","1");// 1초 후 실행
   }, 1000);
   /* $(window).scroll(function (){
      var height=$(document).scrollTop();
      console.log(height);
   }); */
</script>

   <div id="logo" style="text-align:center;">
      <img id="logo-img" src="${path }/${logoPath}" alt="로고1">
      <%-- <img id="logo-img" src="${path }/resources/images/home-logo.jpg" alt="로고1"> --%>
      <label class="main-label-han">${titleHan }</label><br/>
      <label class="main-label-eng">${titleEng }</label><br/>
      <label id="border-bottom">${borderSize }</label>
      <br/>
      <div id="down-scroll" style="text-align:center;">
         <label id="down-arrow">↓</label>
         <div id="up"></div>
         <div id="right"></div>
         <div id="down"></div>
         <div id="left"></div>
      </div>
   </div>
   <section>