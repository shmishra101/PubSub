////////////////////*********Code Editor**********////////////////////

Description : This application lets you signup with multiple publishers and subscribers. Subscribers will get notified when the publisher
they subscribed to publishes an event.

Application Implementaion structure :

Project2 -
  |-->p2v1
  |     |-->Java Resources
  |     |-->build
  |     |-->target
  |     |-->WebContent
  |     |     |-->css
  |     |     |     |-->master.css
  |     |     |-->images
  |     |     |-->WEB_INF
  |     |     |     |-->web.xml
  |     |     |-->Home.jsp
  |     |     |-->Login.jsp
  |     |     |-->Logout.jsp
  |     |     |-->Publish.jsp
  |     |     |-->Publisher_Profile.jsp
  |     |     |-->Refresh.jsp 	
  |     |     |-->Subscribe.jsp
  |     |     |-->Subscriber_Profile.jsp
  |     |     |-->SignUp.jsp
  |     |-->pom.xml


Directory Structure :

Project2 -
  |-->p2v2
  |     |-->README.txt
  |     |-->Dockerfile
  |     |-->Project2Phase2.war



Application prerequisites :
1] Install Docker :
    Linux Users : Run Following Commands
          $ curl -fsSL https://get.docker.com -o get-docker.sh
          $ sh get-docker.sh

    Windows Users : Install Windows Docker Toolbox 
    
    OR

    Go To : www.docker.com 
            and follow installation instructions specific to your OS     


How to run application :
--> Open Terminal
--> Navigate to project folder
--> Build Docker Image 
      $ sudo docker build -t project2 .
      (you can replce project2 with name of your choice)
--> Run mongoDB container
      $ sudo docker run -d -p 27020:27017 --name mongodb -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=admin mongo      
--> Run the docker image you built earlier
      $ sudo docker run -d -p 9999:8080 --link mongodb:mongodb --name container_name project2

Application will start on localhost at port 9999 (You can specify you own port instead of 9999)

Open broweser and go to : http://localhost:9999/phase2

And you are all set!!
SignUp with Publisher and Subscribers in two different windows.
Login with those Publisher and Subscribers in two different windows.
Publisher:
Create Event-->Enter Message->Publish;
Press Compile & Run.
Subscriber:
Subscribe, Unsubscribe.

Get notified when your publisher publishes a message.
///////////////////////////////////////////***********************//////////////////////////////
