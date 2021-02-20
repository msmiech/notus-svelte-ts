# build stage
FROM node:14 AS build

COPY package.json yarn.lock ./
RUN yarn install
COPY . ./
RUN yarn run build

# exec stage
FROM nginx:1.19-alpine
COPY --from=build /public /usr/share/nginx/html