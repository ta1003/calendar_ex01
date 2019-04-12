<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
    
<%
    request.setCharacterEncoding("UTF-8");
 	response.setContentType("text/html; charset=UTF-8");
 	
 	//int color = Math.random() * 3;
 	//request.setAttribute("color", color); 	
%>   
<!DOCTYPE html>
<html>
<head>
	<title>월간 캘린더</title>


<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css">
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css">


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>  
<script type="text/javascript" src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.min.js"></script>
<script type="text/javascript" src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.min.js"></script>
<script type="text/javascript" src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/chance/1.0.13/chance.min.js"></script>
<script src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>

  
</head>
<body>
<h1>
	Hello world!  
</h1>	  
	
	<input name="title" type="hidden">
	<div id="calendar" style="width:800px; height: 600px;"></div>		
	
<script type="text/javascript">
		var Calendar = tui.Calendar;
		
		const templates = {						
			    titlePlaceholder: function() {
			      return '제목';
			    },
			    locationPlaceholder: function() {
			      return '내용';
			    },
			    startDatePlaceholder: function() {
			      return '시작일';
			    },
			    endDatePlaceholder: function() {
			      return '종료일';
			    },					    		    
			    popupSave: function() {			    	
			      return '저장';
			    },
			    popupUpdate: function() {
			      return '수정';
			    },
			    popupIsAllDay: function() {
			        return 'All Day';
			    },
			    popupStateFree: function() {
			       return 'Free';
			    },
			      popupStateBusy: function() {
			        return 'Busy';
			    },
			    popupDetailDate: function(isAllDay, start, end) {
			      var isSameDate = moment(start).isSame(end);
			      var endFormat = (isSameDate ? '' : 'YYYY.MM.DD ') + 'hh:mm a';

			      if (isAllDay) {
			        return moment(start).format('YYYY.MM.DD') + (isSameDate ? '' : ' - ' + moment(end).format('YYYY.MM.DD'));
			      }

			      return (moment(start).format('YYYY.MM.DD hh:mm a') + ' - ' + moment(end).format(endFormat));
			    },		
			    popupDetailUser: function(schedule) {
			           return 'User : ' + (schedule.attendees || []).join(', ');
			     },
			    popupDetailUser: function(schedule) {
	           	 return 'User : 123';
			    },
			    popupEdit: function() {
			      return 'Edit';
			    },
			    popupDelete: function() {
			      return '삭제';
			    },
			    popupDetailLocation : function(schedule) {
					return '내용 :' + schedule.location;
				},			   
			    popupDetailState: function(schedule) {
	            	return 'State : ' + schedule.state || 'Busy';
		        },
			  };			
				
		var calendar = new Calendar('#calendar', {
			  defaultView: 'month',					  
			  template: templates,
			  useCreationPopup: true,
			  useDetailPopup: true	,
			  calendars: [
				    {
				      id: '1',
				      name: '가족',
				      color: '#ffffff',
				      bgColor: '#9e5fff',
				      dragBgColor: '#9e5fff',
				      borderColor: '#9e5fff'
				    },
				    {
				      id: '2',
				      name: '친구',
				      color: '#00a9ff',
				      bgColor: '#00a9ff',
				      dragBgColor: '#00a9ff',
				      borderColor: '#00a9ff'
				    },
				    {
				    	id: '3',
					    name: '회사',
					    color: '#ffa9ff',
					    bgColor: '#ffa9ff',
					    dragBgColor: '#ffa9ff',
					    borderColor: '#ffa9ff'
					 },
				  ]
			});					
		
		
		// 스케쥴 생성
		calendar.on('beforeCreateSchedule',function(schedule){		
			
			// 야매로 일케 처리하면 되겠네
			var color = <%=request.getAttribute("color") %>;
			color = Math.floor(Math.random()*3)+1;
			if(color == 1){
				var bColor = "#FFF000"
			}
			else if(color == 2){
				var bColor = "#FF00FF"
			}
			else if(color == 3){
				var bColor = "#0000FF"
			}
				
			 const result = {						
					    calendarId: String(Math.random() * 10000),
					    id: String(Math.random() * 100000000000000000),
					    title: schedule.title,
					    location : schedule.location,
					    isAllDay: schedule.isAllDay,					   
					    start: schedule.start,
					    end: schedule.end,
					    category: schedule.isAllDay? 'allday' : 'time',
					    color : "#FFFFFF",
					    bgColor : bColor,
					    borderColor : bColor,
					    state : schedule.state
			 };
			 
			 /* calendar.setCalendarColor('1', {
			    color: '#FFFFFF',
		        bgColor: '#FFF000',
			    borderColor: '#FFF000'
			  });
			 
			 calendar.setCalendarColor('2', {
				    color: '#FFFFFF',
			        bgColor: '#FF00FF',
				    borderColor: '#FF00FF'
			 });
			 
			 calendar.setCalendarColor('3', {
				    color: '#FFFFFF',
			        bgColor: '#0000FF',
				    borderColor: '#0000FF'
			 }); */
			
			 
			 calendar.createSchedules([result]);			
			
			//location.href="./insert.do?title="+schedule.title;
		});
		
		// 애가 기본 수정 
		calendar.on('beforeUpdateSchedule', function(scheduleData) {							
			const {schedule} = scheduleData;			
			 calendar.updateSchedule(schedule.id, schedule.calendarId, schedule);
		});
		
		// 앤 모르겠다 일정 드래그 하면 걸로 이동  
	 	calendar.on('clickSchedule', function(event) {
		       var schedule = event.schedule;		     	
		          if (lastClickSchedule) {
		              calendar.updateSchedule(lastClickSchedule.id, lastClickSchedule.calendarId, {
		                  isFocused: false
		              });
		          }
		          calendar.updateSchedule(schedule.id, schedule.calendarId, {
		             isFocused: true
		          });
		     
		         lastClickSchedule = schedule;
		         // open detail view
		     });
	 	
	 	// 마우스 드래그시 
	 	calendar.on('beforeUpdateSchedule', function(event) {
	 	         var schedule = event.schedule;
	 	         var startTime = event.start;
	 	         var endTime = event.end;
	 	    
	 	         calendar.updateSchedule(schedule.id, schedule.calendarId,{
	 	             start: startTime,
	 	             end: endTime
	 	          });
	 	     });
	 	// 삭제시
	 	calendar.on('beforeDeleteSchedule', function(event) {
	 	         var schedule = event.schedule;
	 	          alert('The schedule is removed.', schedule);
	 	         calendar.deleteSchedule (schedule.id, schedule.calendarId,false);
	 	      });
		 
	</script>

	
</body>
</html>
