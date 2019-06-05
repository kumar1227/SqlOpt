# This is your Editor pane. Write the Dockerfile here and 
# use the command line to execute commands
# This is your Editor pane. Write the Dockerfile here and 
# use the command line to execute commands
FROM nginx:latest
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80 433
CMD ["nginx", "-g", "daemon off;"]
