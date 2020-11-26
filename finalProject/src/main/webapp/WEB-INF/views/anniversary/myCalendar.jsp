<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="캘린더" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/logo.jsp"/>

<!--캘린더 라이브러리-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'rel='stylesheet'/>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css' rel='stylesheet' media='print'/>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>
	
<br><br><br><br>
	<div class="container calendar-container" >
		<div id="calendar" style="max-width:900px; margin:40px auto;"></div>
	</div>	
	
</section>	
<script type="text/javascript">
$(document).ready(function(){
	  $('#calendar').fullCalendar({
	    header: {
	      right: 'custom2 prevYear,prev,next,nextYear'
	    },
	    customButtons: { 
	        custom2: {
	          text: '일정관리',
	          id: 'check',
	          click: function() {	
                     
	          }
	        }
	    },
	    eventSources: [
	    	{
				color: 'purple',   
			 	textColor: 'white' 
	    	}
	    ]
	  }); 
});
</script>