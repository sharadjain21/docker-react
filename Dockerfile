# BUILD STAGE
FROM node:alpine as builder-stage
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm build

# RUN STAGE
FROM nginx
EXPOSE 80
COPY --from=builder-stage /app/build /usr/share/nginx/html
