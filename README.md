#Objective
Trim some of the remaining fat off of the alpine-linux docker image in order to create a simpler and more secure base docker image.

##Create a Docker image for future use
###Creating a faster, simpler, more secure base image
Best Practices - http://docs.docker.com/articles/dockerfile_best-practices/

1. Create a new Dockerfile project
2. Create Dockerfile, .dockerignore, README.md, LICENSE stub files
3. Create deluser.sh, delbin.sh, auditing.sh shell script stub files
4. Create a custom image
		edit the dockerfile
		docker run
		`docker build --force-rm=false -t brianmcmillan01/alpine-trim:0.0.5 .`
		`docker run -ti --name=alpine-trim-0.0.5 brianmcmillan01/alpine-trim:0.0.5`

##TO DO
[ ] Add SSH support and documentation  
[ ] Package the image  
		docker export  
		docker import  
[ ] Add support for building for multiple environments  
		docker build ENV  
[ ] Document House keeping  
		docker history  
		docker rmi  

----

##Notes and links
https://developer.atlassian.com/blog/2015/08/minimal-java-docker-containers/
http://wiki.alpinelinux.org/wiki/Setting_up_a_ssh-server
http://southworks.com/blog/2015/07/17/docker-compose-scaling-multi-container-applications/
https://medium.com/@rdsubhas/docker-for-development-common-problems-and-solutions-95b25cae41eb#.nab5yx5kc
https://www.phusionpassenger.com/library/walkthroughs/deploy/nodejs/ownserver/nginx/oss/trusty/deploy_app.html
http://mrbluecoat.blogspot.com/2014/10/docker-traps-and-how-to-avoid-them.html
https://opensource.com/business/14/9/security-for-docker
