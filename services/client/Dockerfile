FROM node:16.13.1-alpine

WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH


COPY package.json ./
#COPY package-lock.json ./

RUN rm -rf yarn.lock
RUN rm -rf package-lock.json

RUN yarn install --silent
# add app
COPY . ./

RUN yarn build

ENV REACT_APP_USERS_SERVICE_URL "backend.ragnarok.rocks"

ENV NODE_ENV "3000"

# start app

#RUN yarn start

CMD yarn start

#CMD ["npm", "run", "dev"]
# CMD ["npm", "run", "start"]