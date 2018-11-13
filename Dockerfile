# specify a base image
FROM node:alpine

EXPOSE 8080

# specify working directory
WORKDIR /bindmount

# install dependencies
RUN npm install -g npm
RUN npm install -g yarn

# copy dependencies
COPY ./package.json ./yarn.lock ./

RUN yarn install

# copy project
COPY ./ ./

# default command: # webpack-dev-server --host 0.0.0.0 --hot --inline
CMD yarn run start
