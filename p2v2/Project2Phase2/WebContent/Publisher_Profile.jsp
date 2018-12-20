<%@ page import="project2.Publisher" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="ISO-8859-1">
 <meta charset="utf-8">
 <link rel="stylesheet" type="text/css" href="css/master.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<title>Publisher</title>
</head>
<%
 session.setAttribute("id", session.getAttribute("id"));

%>

<body>

<div class="container-fluid">
    <div class="jumbotron text-center">
      <h1>Society Manager</h1>
      <p>Welcome Publisher!</p>
    </div>

    <div class="row">
      
      <div class="col-lg-5">
         <div class="jumbotron" type="hello">
          <h2>Create Event</h2>
          <p> You can create a event by writing an invite and submitting it. To get started press button below.</p>
          <br>
          <div>
            <button type="button" id="createEvent" class="btn btn-info" >Create Event</button>
          </div>
         </div>
      </div>

		<!--  	
      <div class="row">
        <div class="col-lg-5">
           <div class="jumbotron" type="world">
            <h2>Get Subscribers</h2>
            <p> You can get the list of Subscribers you have here. To get the list, press the button below.</p>
            <br>
            <div>
              <button type="button" id="getSubscribers" onclick="getSub" class="btn btn-info" data-toggle="modal" data-target="#getSubModal">Get Subscribers</button>
            </div>
           </div>
        </div>

		-->

  </div>

	<form action="Logout.jsp" method="post">
	
	<div>
		<button class="btn btn-danger">Logout</button>
	</div>
	
	</form>	
    
    
    <div id="publisherModal" class="modal">
          <div class="modal-content">

            <div>
              <span class="cancel">&times;</span>
            </div>

            <div>
              <h3 class="welcome">Welcome Publisher</h3>
            </div>

            <div>
              <form class="formClass" action="Publish.jsp" method="post">
                <div>
                  <label for="eventMsg"></label>
                </div>
                <div class="textArea">
                  <textarea name="event" id="eventMsg" rows="8" placeholder=" Enter your event message here.."></textarea>
                </div>
                <div>
                  <button class="publish" type="submit" name="submit" value="Publish">Publish</button>
                </div>
              </form>
            </div>

          </div>
      </div>
</body>
 <script type="text/javascript">

    var modal = document.getElementById('publisherModal');
    var cancel = document.getElementsByClassName('cancel')[0];
    var btn = document.getElementById('createEvent');
    
   

    // When the user clicks on the button, open the modal
    btn.onclick = function() {
    	modal.style.display = "block";
    }

    // When the user clicks on (x), close the modal
    cancel.onclick = function() {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

  </script>
</html>