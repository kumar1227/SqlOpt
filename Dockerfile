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
