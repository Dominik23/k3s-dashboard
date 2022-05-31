FROM node:18 as build

WORKDIR /usr/local/app

COPY ./ /usr/local/app/

RUN npm ci

RUN npm run build

FROM nginx:latest 

COPY --from=build /usr/local/app/dist/k8s-dashboard /usr/share/nginx/html
