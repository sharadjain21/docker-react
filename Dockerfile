# BUILD STAGE
FROM node:alpine as builder-stage
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm build

# RUN STAGE
FROM nginx
COPY --from=builder-stage /app/build /usr/share/nginx/html
