###########
# BUILDER #
###########

# base image
FROM node:11.12.0-alpine as builder

# set working directory
WORKDIR /usr/src/app

# install app dependencies
ENV PATH /usr/src/app/node_modules/.bin:$PATH
COPY package.json /usr/src/app/package.json
COPY package-lock.json /usr/src/app/package-lock.json
RUN npm ci
RUN npm install react-scripts@2.1.8 -g --silent

# set environment variables
ENV REACT_APP_USERS_SERVICE_URL "backend.ragnarok.rocks"

ENV NODE_ENV "3000"

EXPOSE 3000
# create build
COPY . /usr/src/app
RUN npm run build


