# This is your Editor pane. Write the Dockerfile here and 
# use the command line to execute commands
FROM nginx:alpine
COPY . /usr/share/nginx/html
