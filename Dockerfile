FROM node:boron-alpine AS builder

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
COPY yarn.lock /usr/src/app/
RUN yarn install

# Bundle app source
COPY . /usr/src/app
ENV NODE_ENV=production
RUN yarn build

FROM node:boron-alpine

ENV NODE_ENV=production

# Add tini
RUN apk add --no-cache tini
ENTRYPOINT ["/sbin/tini", "--"]

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
COPY yarn.lock /usr/src/app/
RUN yarn install

# Bundle app source
COPY --from=builder /usr/src/app/build/ /usr/src/app/

# Dont run as root
USER node

CMD [ "node", "app/index.js" ]
