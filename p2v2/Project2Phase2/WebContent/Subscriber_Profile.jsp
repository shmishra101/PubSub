<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="project2.Subscriber" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <title>Publisher</title>
  </head>
<%
Subscriber subscribe=new Subscriber();
String id=session.getAttribute("id").toString();
session.setAttribute("id", id);
%>
<script type="text/javascript">

      function loadXMLDoc()
      { 
        var xmlhttp;
        var config='<%=id%>';
        var url="Refresh.jsp?id="+config;
        if (window.XMLHttpRequest)
        {
            xmlhttp=new XMLHttpRequest();
        }
        else
        {
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange=function()
        {
            if (xmlhttp.readyState==4 && xmlhttp.status==200)
            {   
                var message=xmlhttp.responseText;
                var messagesplit=message.split("\n");
                var i = 1;
                 alert(messagesplit.length);
                //document.getElementById('pubname').innerHTML = messagesplit[1];
                if(messagesplit.length==1)
                {
                	document.getElementById('mydiv').innerHTML='No New Messages';
                }
                var j=1;
                var messages=[];
                while(j<messagesplit.length-1)
                {
                	messages.push(messagesplit[j]);
                	j++;
                }
                i=0;
                while(i<messages.length)
                {
                    document.getElementById('mydiv').innerHTML += '<div>'+messages[i]+'</div>';
                    document.getElementById('mydiv').innerHTML += '<div>'+messages[i+1]+'</div>';
                //document.getElementById('pubmessage').innerHTML = messagesplit[i+2];
                    i=i+2;
                }
               
            }
        }

        xmlhttp.open("GET", url, true);
        xmlhttp.send();
}
</script> 
  <body>


  <div class="container-fluid">
    <div class="jumbotron text-center">
      <h1>Society Manager</h1>
      <p>Welcome Subscriber</p>
    </div>

    <div class="row">
      <div class="col-md-6">
         <div class="card flex-md-row mb-4 shadow-sm h-md-250">
            <div class="card-body d-flex flex-column align-items-start">
               <strong class="d-inline-block mb-2 text-primary">Subscribers</strong>
               <% 
                   
                    List<String> allpublisher=subscribe.allpublisher();
                    List<String> subscribedpublisher=subscribe.subscribedpublisher(id);
                    List<String> availablepublisher=subscribe.availablepublisher(subscribedpublisher, allpublisher);
                   //out.println(subscribe.subscribedpublisher(id));
                    int j=0;
                    while(j<subscribedpublisher.size())
                    {   
                    	out.println("<div class="+"mb-1 text-muted small"+">"+subscribedpublisher.get(j)+"</div>");
                    	out.println("<form action=\"Subscribe.jsp\"><input name=\"dwld\" type=\"hidden\" value=\""+subscribedpublisher.get(j)+"\"/><input name=\"button\" type=\"hidden\" value=\"UnSubscribe\"/><input class=\"btn btn-outline-success btn-sm\" type=\"submit\" value=\"UnSubscribe\"/></form>");
                    	j++;
                    }
                    // subscribe.unsubscribe(id, "shmi");
                %>
               
               
            </div>
         </div>
           <div>
            <br>
            <button class="btn btn-outline-success btn-sm" onclick=loadXMLDoc()>Refresh</button>
           </div>
           <div id="mydiv">
             <p id="pubname"></p>
             <p id="pubmessage"></p>
           </div>
      </div>
      <div class="col-md-6">
         <div class="card flex-md-row mb-4 shadow-sm h-md-250">
            <div class="card-body d-flex flex-column align-items-start">
               <strong class="d-inline-block mb-2 text-success">Available Subscriber</strong>
               <%
                 j=0;
                 if(availablepublisher.size()==0)
                 {
                	 out.println("<div class="+"mb-1 text-muted small"+">"+"No Available Subscriber"+"</div>");
                 }
                 while(j<availablepublisher.size())
                 {
               	   out.println("<div class="+"mb-1 text-muted small"+">"+availablepublisher.get(j)+"</div>");
               	   out.println("<form action=\"Subscribe.jsp\"><input name=\"dwld\" type=\"hidden\" value=\""+availablepublisher.get(j)+"\"/><input name=\"button\" type=\"hidden\" value=\"Subscribe\"/><input class=\"btn btn-outline-success btn-sm\" type=\"submit\" value=\"Subscribe\"/></form>");
               	   j++;
                 }
               %>
               
            </div>
         </div>
      </div>
   </div>

  </div>



  </body>

</html>

