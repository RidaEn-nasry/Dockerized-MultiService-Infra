
# FROM node
# LABEL maintainer ennasry.rida@gmail.com
# RUN git clone -q https://github.com/docker-in-practice/todo.git
# WORKDIR todo 
# RUN npm install >  /dev/null
# EXPOSE 8000
# CMD ["npm", "start"]


FROM ubuntu
RUN echo hihi 
RUN touch /hi 
RUN rm /hi
CMD ["echo", "hello world"]
