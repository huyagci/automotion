FROM node:18.4.0-alpine3.16
WORKDIR /opt/react-app
COPY app/ ./ 
RUN npm i
EXPOSE 3000
ENTRYPOINT [ "npm" ]
CMD [ "start" ]