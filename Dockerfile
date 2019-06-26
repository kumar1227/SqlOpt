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

