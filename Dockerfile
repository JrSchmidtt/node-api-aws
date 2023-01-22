FROM node:latest

WORKDIR /usr/app

COPY package.json package-lock.json nodemon.json ./
COPY /src ./src

RUN npm install
RUN npm install nodemon -g

EXPOSE 3000

CMD [ "npm", "run", "start" ]