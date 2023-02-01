FROM node:12-alpine3.14

//WORKDIR /app
WORKDIR /usr/src/app

//COPY package.json /app
COPY package*.json ./

RUN npm install

//COPY . /app
COPY . .

EXPOSE 8081

//CMD node index.js
CMD [ "node", "index.js" ]


