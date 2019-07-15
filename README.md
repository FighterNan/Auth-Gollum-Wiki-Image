# Gollum-Authentication-Docker-Image
A ready-to-use docker image for Github-Synchronized, Markdown-based, and Auth-Enabled Wiki System. No environment issues anymore. Get docker installed and set up your Wiki in a second!

A live demo is available [here](http://www.nan-zhou.com:4567).    
More details can be found in [this post](https://nan-zhou.com/blog/index.php/2019/07/14/github-synchronized-markdown-based-and-auth-enabled-wiki-system/).     
Docker images can be found [here](https://cloud.docker.com/u/nanzhoumails/repository/docker/nanzhoumails/auth_wiki).    

## Run 
Create your Github wiki, clone it to some local directory. For example,  
```bash
git clone https://github.com/FighterNan/FighterNan.github.io.wiki.git
```

Run the service on the root of your Wiki repo. 
```bash
cd FighterNan.github.io.wiki
sudo docker run \
-v ${PWD}:/home/wiki_repo \
-p 4567:4567 \
-e GITHUB_CLIENT_ID=xxx \
-e GITHUB_CLIENT_SECRET=xxx \
-e AUTH_EMAIL=nanzhoumails@gmail.com \
--name wiki \
nanzhoumails/auth_wiki:latest
```
There are three environment variables you should set. `GITHUB_CLIENT_ID ` and `GITHUB_CLIENT_SECRET` are available once you set your Github OAuth App. See [here](https://developer.github.com/apps/building-oauth-apps/creating-an-oauth-app/) for official tutorial.  `AUTH_EMAIL` specifies the user who can edit the pages. Other users can only view the pages. 

## config.rb
The original script is from [here](https://ronnieroller.com/Gollum). I change the hard-coded configurations to environment varibles.

## Reference
[gollum](https://github.com/gollum/gollum)   

[omnigollum](https://github.com/arr2036/omnigollum) 
