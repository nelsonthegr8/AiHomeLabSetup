# AiHomeLabSetup
I am currently setting up and testing a ai lab setup on my main gaming computer.
When i am comfortable enough and learn enough this whole setup will live on a dedicated pc build
with beefier specs to serve as my full time setup. In this repo is everything i need/ you need to get a home lab up 
and running for chatting with an llm,ai agents, training your own models, or finetuning models.

## Current Setup
I am Currently using Ubuntu that comes with the windows wsl. I will just need to install ubuntu server on my actual build when the time comes.

## Start Up
Using the startup folder just run the bash script i have in there bootstrap.sh 
running that script will get you all the stuff you need to host your own llm using ollama and using open-webui to 
interact with the llm visually. 

## Things To Note
If you are using wsl like me and are hosting your model there but want to access open-webui from your phone.
Make sure to enable portforwarding for your ipaddress for your main computer and port 8080 over to the port that wsl 
assigns to your docker container. Because for me it varied. I made the change using windows powershell and ran 2 lines:

To get the ipaddress of the wsl container run: ip addr show eth0

Then run these 2 commands in windows powershell:

netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=8080 connectaddress={ipaddress found in wsl} connectport=8080

netsh advfirewall firewall add rule name="WSL Port 8080" dir=in action=allow protocol=TCP localport=8080

