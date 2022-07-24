# stage 1 as builder
FROM node:16-alpine as builder

RUN mkdir /app

WORKDIR /app

# copy the package.json to install dependencies
COPY package.json package-lock.json ./

# Install the dependencies and make the folder
RUN npm install

COPY . .

# Build the project and copy the files
RUN npm run build

# Stage 2
FROM nginx:1.23-alpine

COPY ./docker/nginx.conf /etc/nginx/nginx.conf

## Remove default nginx index page
RUN rm -rf /var/www/*

ENV BASE_URL=https://jsonplaceholder.typicode.com

# Copy from the stage 1
COPY --from=builder /app/dist/ng-dockerized-prod /var/www
COPY ./docker/entrypoint.sh /docker-entrypoint.d/

EXPOSE 8080

