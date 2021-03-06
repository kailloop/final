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
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'rel='stylesheet'/>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css' rel='stylesheet' media='print'/>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script> -->

<link href='${path }/resources/css/calendar.css' rel='stylesheet' />
<script src='${path }/resources/js/calendar.js'></script>
<style>
 body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }
</style>
	
<br><br><br><br>
	<div id='calendar'></div>	
	
	
	<table style="visibility: hidden;">
		<tr>
            <th>제목</th>
        	<th>날짜</th>
        </tr>
        <c:forEach var="c" items="${jsonList}">
        <tr>
        	<td id="cTitle"><c:out value="${c.calendarTitle}" /></td>
        	<td id="cWriter"><c:out value="${c.calendarWriter}" /></td>
        </c:forEach>
	</table>
	
</section>	
<script>
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        /* right: 'dayGridMonth,timeGridWeek,timeGridDay' */
        right: ''
      },
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
       select: function(arg) {
        var title = prompt('일정 추가:');
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end
            
          })
        location.reload();
        }
        calendar.unselect()
      }, 
      eventClick: function(arg) {
    	 if (confirm('일정을 삭제하시겠습니까? 삭제하시면 다시 복구하실 수 없습니다.')) {
          arg.event.remove()
        } 
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events

     

    <c:forEach items="${list}" var="l">
      events: {
    	    url: '/',
    	    method: 'POST',
    	    
    	    
    	    extraParams: {
    	    
    	    	title: '${l.calendarTitle}',
    	        start: '2020-09-07',
    	        end: '2020-09-10'
    	    
    	    },
    	    failure: function() {
    	      alert('캘린더 목록 불러오기실패');
    	    },
    	    color: 'yellow',  
    	    textColor: 'black'
    	  }
    </c:forEach>
      
      
    });
    calendar.render();
  });
<<<<<<< HEAD
=======

>>>>>>> branch 'JH' of https://github.com/kailloop/final.git
</script>
<jsp:include page='/WEB-INF/views/common/footer.jsp'/>