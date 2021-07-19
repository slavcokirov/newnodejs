FROM node:14-alpine as base

WORKDIR /src/myapp
COPY package*.json /src/myapp/

FROM base as production
ENV NODE_ENV=production
RUN npm ci
COPY . /src/myapp/
CMD ["node", "bin/www"]

FROM base as dev
ENV NODE_ENV=development
RUN npm install -g nodemon && npm install
COPY . /src/myapp/
CMD ["nodemon", "bin/www"]