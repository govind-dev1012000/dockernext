# FROM node:16-alpine as build
# # Installing libvips-dev for sharp Compatibility
# RUN apk update && apk add build-base gcc autoconf automake zlib-dev libpng-dev vips-dev && rm -rf /var/cache/apk/* > /dev/null 2>&1
# ARG NODE_ENV=production
# ENV NODE_ENV=${NODE_ENV}
# WORKDIR /opt/
# COPY ./package.json ./package-lock.json ./
# ENV PATH /opt/node_modules/.bin:$PATH
# RUN npm install --production
# WORKDIR /opt/app
# COPY ./ .
# RUN npm run build


# FROM node:16-alpine
# # Installing libvips-dev for sharp Compatibility
# RUN apk add vips-dev
# RUN rm -rf /var/cache/apk/*
# ARG NODE_ENV=production
# ENV NODE_ENV=${NODE_ENV}
# WORKDIR /opt/app
# COPY --from=build /opt/node_modules ./node_modules
# ENV PATH /opt/node_modules/.bin:$PATH
# COPY --from=build /opt/app ./
# EXPOSE 1337
# CMD ["npm", "run","start"]


# Dockerfile

# base image
FROM node:alpine

# create & set working directory
RUN mkdir -p /usr/src
WORKDIR /usr/src

# copy source files
COPY . /usr/src

# install dependencies
RUN npm install

# start app
RUN npm run build
EXPOSE 3000
CMD npm run start