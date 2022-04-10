FROM nginx:stable

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /usr/app

COPY ./package*.json ./

RUN apt-get update && apt-get install git nginx curl -y
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get -qq install nodejs -y
RUN npm install
RUN npm install -D esbuild-linux-64@0.14.31

COPY ./ ./

RUN npx rakkas build -d static
RUN mkdir -p /usr/share/nginx/html && \
    cp -rf dist/* /usr/share/nginx/html
