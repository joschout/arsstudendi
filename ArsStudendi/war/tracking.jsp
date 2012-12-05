<!DOCTYPE html> 
<html> 
<head> 
	<title>ArsStudendi</title> 
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.2.0/jquery.mobile-1.2.0.min.css" />
	<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.2.0/jquery.mobile-1.2.0.min.js"></script>
	

</head> 
<body> 

<div data-role="page">
		
 		
<script>
var check;
function reNew(){
<% String aCheck = (String)request.getAttribute("aCheck");
		if(aCheck == null){
		%>
		check= "stopped";
		$("#demo").hide();
		$("#numPages").hide();
		<%}
		else{%>	
		check= "started"; 
		<% if(!(aCheck.equals("STUDY"))){%>
		$("#numPages").hide();
		$("#courses").hide();
		<%}}%>
 }

	var timePassed = "<%= request.getAttribute("timePassed")%>";
	timePassed = parseInt(timePassed);
	var localTP;
	
	function localTime(){
	if(timePassed == -1){
		localTP = "Testing";
	}
	else{
	localTP = timePassed;
	}
	}
	function myTimer()
	{
	localTP = localTP + 1;
	$("#demo").text(localTP);
	}
	function display(){
	setInterval("myTimer()",1000);
	}

		
function hideList2(){
	if($("#option1 option:selected").val() != "STUDY"){
	$("#option2").hide();
	}
	else{
	$("#option2").show();
	}
	}

function testF(){
if(check == "started"){
	$("#start").hide();
	$("#option1").hide();
	$("#option2").hide();


}
else{
	$("#stop").hide();
	$("#cancel").hide();
	$("#numPages").hide();
	$("#courses").hide();
	
}
}


function myLiveEventHandler(event)
{
  if(event.handled !== true)
  {
  	reNew();
  	localTime();
  	display();
    testF();
    event.handled = true;
  }
  return false;
}
$(document).bind("pageinit", myLiveEventHandler);

</script>


	<div data-role="header" data-theme="b">
		<a href="index.jsp" data-role="button" data-icon="home" data-iconpos="notext" data-ajax="false">Home</a> 
		<h1><%out.println("Tracking");%></h1>
		<a href="logout.jsp" data-role="button" data-icon="delete">Log Out</a>
	</div>
	
		<div data-role="content" >
		<form action="/tracking" method="POST" data-ajax="false">
		
			<div id="addActivity"><button type="submit" name="addActivity" data-theme="b" value="addActivity">addActivity</button></div>
			
			<div data-role="fieldcontain">
   				<fieldset data-role="controlgroup">
   			
   					<div id="option1">
						<label for="option1" class="select"></label>
						<select name="option1" id="option1" onChange="hideList2();">
							<option value=STUDY>Study</option>
							<option value=SPORT>Sport</option>
   							<option value=SOCIAL>Social</option>
   							<option value=SLEEP>Sleep</option>
   						</select>
   					</div>
   			
   					<div id="option2">
   						<label for="option2" class="select"></label>
						<select name="option2">
							<option value="Lecture">Lecture</option>
   							<option value="SelfTeaching">Self Teaching</option>
   							<option value="TeamWork">Teamwork</option>
   							<option value="Practice">Practice</option>
   						</select>
   					</div>
   			
   				</fieldset>
			</div>
			
			<div id="start">
				<button type="submit" name="start" data-theme="b" value="start">Start</button>
			</div>
			
			<div id="demo"></div>
			
		
			
			
			<div data-role="fieldcontain" class="ui-hide-label" id="numPages">
				<label for="numberOfPages" class="select">Amount Studied</label><br>
				<input type="text" name="numberOfPages"  value="" placeholder="# Pages"/>
			</div>
			
			<div data-role="fieldcontain" id="courses">
			<label for="select-choice-0" class="select">Course</label><br>
			<select name="courses">
			<%
				String[] courseNames = (String[])request.getAttribute("studentCourses");
				int i = 0;
				if( courseNames != null){
				while(i<courseNames.length) {%>
   			<option value = <%out.println(courseNames[i]);%>> <%out.println(courseNames[i]);%> </option>
   			<%i++;}}%>
			</select>
			</div>
   					
			<fieldset class="ui-grid-a">
				<div class="ui-block-a" id="stop"><button type="submit" name="stop" data-theme="b" value="stop">Stop</button></div>
				<div class="ui-block-b" id="cancel"><button type="submit"  name="cancel" data-theme="b" value="cancel" >Cancel</button></div>	   
			</fieldset>
			
		</form>  
        </div>
		
 
		
		

        


	
	
	
	

</div>


</body>
</html>