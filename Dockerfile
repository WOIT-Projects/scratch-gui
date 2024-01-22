FROM alpine:3.5 as git
RUN apk update
RUN apk add git
RUN git clone https://github.com/WOIT-Projects/scratch-vm.git --depth 1

FROM node:16-alpine as scratch-vm
WORKDIR /app
COPY --from=git scratch-vm ./
RUN npm install
ENV BUILD_MODE=dist
RUN npm run build

FROM node:16-alpine as scratch-gui
WORKDIR /app

COPY . .
RUN npm install

FROM node:16-alpine as build
WORKDIR /app
COPY --from=scratch-vm /app/. /app/scratch-vm
COPY --from=scratch-gui /app/. /app/scratch-gui
WORKDIR /app/scratch-vm
RUN npm link
WORKDIR /app/scratch-gui
RUN npm link scratch-vm
RUN npm run build


FROM nginx as prod
COPY --from=build /app/scratch-gui/build /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
