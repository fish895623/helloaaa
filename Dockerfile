FROM node:16.14-alpine

WORKDIR /usr/app

COPY ./package*.json ./

RUN apk add git
RUN npm install
RUN npm install -D esbuild-linux-64@0.14.31

COPY ./ ./

RUN npm run build

USER node

CMD [ "npm", "start" ]
