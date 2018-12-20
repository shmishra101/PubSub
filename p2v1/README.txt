////////////////////*********Code Editor**********////////////////////

Description : This application lets you enter a JAVA code, compiles it in docker container and displays the output.

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
  |     |     |-->index.jsp
  |     |     |-->result.jsp
  |     |-->pom.xml


Directory Structure :

Project2 -
  |-->p2v1
  |     |-->README.txt
  |     |-->Dockerfile
  |     |-->Project2Phase1.war



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
--> Run the docker image you built earlier
      $ sudo docker run -d -p 9999:8080 --name container_name project2

Application will start on localhost at port 9999 (You can specify you own port instead of 9999)

Open broweser and go to : http://localhost:9999/phase1

And you are all set!!
Edit the code area.
Press Compile & Run.
Output will be displayed in the adjoining window.

///////////////////////////////////////////***********************//////////////////////////////
