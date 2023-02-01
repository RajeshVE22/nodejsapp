FROM node:12-alpine3.14

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8086

CMD [ "node", "index.js" ]


