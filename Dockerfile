# This is your Editor pane. Write the Dockerfile here and 
# use the command line to execute commands
# This is your Editor pane. Write the Dockerfile here and 
# use the command line to execute commands
#Topic 1:
FROM nginx:latest
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80 433
CMD ["nginx", "-g", "daemon off;"]
#CMD:

#Topic 2:
FROM node:10-alpine
RUN mkdir -p /src/app
WORKDIR /src/app
COPY package.json /src/app/package.json
RUN npm install
COPY . /src/app
EXPOSE 3000
CMD [ "npm", "start" ]
#CMD: docker run -d --name my-production-running-app -e NODE_ENV=production -p 3000:3000 my-nodejs-app

#Topic 3: ONBUILD
FROM node:7
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
ONBUILD COPY package.json /usr/src/app/
ONBUILD RUN npm install
ONBUILD COPY . /usr/src/app
CMD [ "npm", "start" ]
#CMD: docker build -t node:7-onbuild
#Creating image on top of node:7-onbuild image
FROM node:7-onbuild
EXPOSE 3000
#CMD: docker build -t my-nodejs-app:latest
#CMD: docker run -d --name my-running-app -p 3000:3000 my-nodejs-app

#Topic 4: .dockerignore
FROM alpine
ADD . /app
COPY cmd.sh /cmd.shl
CMD ["sh", "-c", "/cmd.sh"]
#CMD: docker build -t password .
#CMD: docker run password ls /app
#OUTPUT:
#Dockerfile
#cmd.sh
#passwords.txt
echo "passwords.txt" >> .dockerignore
#CMD: docker build -t nopassword .
#CMD: docker run nopassword ls /app
#OUTPUT:
#Dockerfile
#cmd.sh

#Topic 5: Data Container
#CMD: docker create -v /config --name dataContainer busybox
#CMD: docker cp config.conf dataContainer:/config/
#Lauching an Ubuntu container using "--volumes-from <dataContainer>" option to mount volume of other container
#CMD: docker run --volumes-from dataContainer ubuntu ls /config
#Exporting data container to tar file
#CMD: docker export dataContainer > dataContainer.tar
#Importing data container from tar file
#CMD: docker import dataContainer.tar
#CMD docker tag <ImageID> <TagName>:<Verion>

#Topic 6: Creating networks b/w contianers using links
