FROM node:16.14-alpine

WORKDIR /usr/app

COPY ./package*.json ./

RUN apk add git
RUN npm install
RUN npm install -g serve
RUN npm install -D esbuild-linux-64@0.14.31

COPY ./ ./

RUN npx rakkas build -d static

USER node

CMD [ "serve", "-s", "dist/" ]
