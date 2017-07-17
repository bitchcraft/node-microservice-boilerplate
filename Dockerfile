from node:alpine

# Install OS dependencies
RUN apk add --update git

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN yarn install

# Bundle app source
COPY . /usr/src/app

CMD [ "node", "index.js" ]
