<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="FAQ" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>

<style>
	section{
		max-height: auto;
	}
        #icontable i{
            font-size:100px;
            text-shadow: 3px 3px 4px rgb(170, 170, 170);
        }
        td{
            width: 200px;
            text-align: center;  
        }
        td label:hover{
           color:#DD2D4A;
        }
        #icontable p{
            font-weight: bold;
        }
        label{
            cursor: pointer;
        }
        #detaildiv{
            padding-top: 50px;
            text-align: left;
            margin-left: auto;
            margin-right: auto;
        }
        a{
            font-size: 20px;
            text-decoration: none;
            color: #4C4C4C;
        }
        div div p{
            color:#D9418C;
            font-weight: bold;
        }
        table{
            margin-left: auto; margin-right: auto;
        }
        #detaildiv table{
              border-collapse: separate;
            border-spacing: 60px;
            width: 650px;
        }
        #detaildiv i{
            font-size: 80px;
        }
        .aname{
            font-size: 20px;
            font-weight: bold;
        }
        .hovertr td i:hover{
            color:#DD2D4A;
        }
        .hovertr td a:hover{
            color:#DD2D4A;
        }
        section{
            max-height: auto;
        }
        
        
    </style>

    <div id="btndiv" style="text-align: center; margin-top: 150px;">
    	<button  type="button" class="btn btn-outline-danger">날짜 다시선택하기</button>
    </div>
    
<div id="icondiv" style="margin-top: 200px;">
        <table id="icontable">
            <tr>
                <td>
                    <label id="stayicon">
                        <i class="fas fa-bed"></i>
                        <p>숙박</p>
                    </label>
                </td>
                <td>
                    <label id="areaicon"> 
                        <i class="fas fa-place-of-worship"></i>
                        <p>명소</p>
                    </label>
                </td>
                <td>
                    <label id="resticon">
                        <i class="fas fa-utensils"></i>
                        <p>음식</p>
                    </label>
                </td>
                <td>
                    <label id="actiicon">
                        <i class="fas fa-running"></i>
                        <p>액티비티</p>
                    </label>
                </td>
                <td>
                    <label id="allicon">
                        <i class="fas fa-plus"></i>
                        <p>전체보기</p>
                    </label>
                </td>

                
            </tr>
        </table>

    </div>

    <div id="detaildiv">
        <table id="staylist" style="display: none;">
            <tr>
                <td>
                    <p class="aname"><i class="fas fa-bed" style="font-size: 15px;"></i> 숙박</p>
                </td>
            </tr>
            <tr class="hovertr">
                <td>
                    <a href="#"> <i class="fas fa-plus"></i> <br>전체보기</a>
                </td>
                <td>
                    <a href="#"><i class="fas fa-hotel"></i> <br>호텔</a>
                </td>
                <td>
                    
                    <a href="#"><i class="fas fa-home"></i> <br>펜션</a>
                </td>
            </tr>
            <tr class="hovertr">
                <td>
                    
                    <a href="#"><i class="fas fa-campground"></i> <br>글램핑/캠핑</a>
                </td>
                <td>
                    
                    <a href="#"><i class="fas fa-house-user"></i> <br>게스트하우스</a>
                </td>
                <td class="backtd">
                    <a href="#"><i class="fas fa-arrow-left"></i> <br>뒤로가기</a>
                </td>
            </tr>
        </table>


        <table id="arealist" style="display: none; ">
            <tr>
                <td>
                    <p class="aname"><i class="fas fa-place-of-worship" style="font-size: 15px;"></i> 명소</p>
                </td>
            </tr>
            <tr class="hovertr">
                <td>
                    <a href="#"> <i class="fas fa-plus"></i> <br>전체보기</a>
                </td>
                <td>
                    <a href="#"><i class="fas fa-certificate"></i><br>랜드마크</a>
                </td>
                <td>
                    <a href="#"><i class="fas fa-tree"></i><br>자연/공원</a><br>
                </td>
            </tr>
            <tr class="hovertr">
                <td>
                    <a href="#"><i class="fas fa-horse"></i><br>놀이동산</a>
                </td>
                <td>
                    <a href="#"><i class="fas fa-swimming-pool"></i><br>워터파크</a>
                </td>
                <td class="backtd">
                    <a href="#"><i class="fas fa-arrow-left"></i> <br>뒤로가기</a>
                </td>
            </tr>
        </table>

        <table id="restlist" style="display: none;">
            <tr>
                <td>
                    <p class="aname"><i class="fas fa-utensils" style="font-size: 15px;"></i> 음식</p>
                </td>
            </tr>
            <tr class="hovertr">
                <td>
                    <a href="#"> <i class="fas fa-plus"></i> <br>전체보기</a>
                </td>
                <td>
                    <a href="#"><i class="fas fa-concierge-bell"></i><br>식당</a>
                </td>
                <td>
                    
                    <a href="#"><i class="fas fa-coffee"></i><br>카페</a>
                </td>
            </tr>
            <tr class="hovertr">
                <td class="backtd">
                    <a href="#"><i class="fas fa-arrow-left"></i> <br>뒤로가기</a>
                </td>
            </tr>
        </table>



        <table id="actilist" style="display: none; ">
            <tr>
                <td>
                    <p class="aname"><i class="fas fa-running"style="font-size: 15px;"></i> 액티비티</p>
                </td>
            </tr>
            <tr class="hovertr">
                <td>
                    <a href="#"> <i class="fas fa-plus"></i> <br>전체보기</a>
                </td>
                <td>
                    <a href="#"><i class="fas fa-snowboarding"></i><br>스키/썰매</a>
                </td>
                <td>
                    <a href="#"><i class="fas fa-fish"></i><br>낚시</a>
                </td>
            </tr>
            <tr class="hovertr">
                <td>
                    <a href="#"><i class="fas fa-tint"></i><br>수상레저</a>
                </td>
                <td>
                    <a href="#"><i class="fas fa-motorcycle"></i><br>바이크</a>
                </td>
                <td class="backtd">
                    <a href="#"><i class="fas fa-arrow-left"></i> <br>뒤로가기</a>
                </td>
            </tr>
        </table>
       

     
   


        
        
    </div>
    
    
    


</section>

<script>
        $(function(){
        	$("#stayicon").click(function(){
        		$("#icondiv").slideUp(800); 
        		$("#btndiv").slideUp(800); 
                $("#staylist").show();
                $("#arealist").hide();
                $("#restlist").hide();
                $("#actilist").hide();
            });

            $("#areaicon").click(function(){
            	$("#icondiv").slideUp(800); 
            	$("#btndiv").slideUp(800); 
                $("#staylist").hide();
                $("#arealist").show();
                $("#restlist").hide();
                $("#actilist").hide();
            });

            $("#resticon").click(function(){
            	$("#icondiv").slideUp(800);
            	$("#btndiv").slideUp(800); 
                $("#staylist").hide();
                $("#arealist").hide();
                $("#restlist").show();
                $("#actilist").hide();
            });

            $("#actiicon").click(function(){
            	$("#icondiv").slideUp(800); 
            	$("#btndiv").slideUp(800); 
                $("#staylist").hide();
                $("#arealist").hide();
                $("#restlist").hide();
                $("#actilist").show();
            });

            $("#allicon").click(function(){
            	$("#icondiv").slideUp(800); 
            	$("#btndiv").slideUp(800); 
                $("#staylist").show();
                $("#arealist").show();
                $("#restlist").show();
                $("#actilist").show();
            });
           
            
            $(".backtd").click(function(){
            	$("#icondiv").slideDown(800);
            	$("#btndiv").slideDown(800);
            	 $("#staylist").hide();
                 $("#arealist").hide();
                 $("#restlist").hide();
                 $("#actilist").hide();
                return false;
    		});	
        });
    </script>