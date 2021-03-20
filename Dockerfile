FROM node:lts-alpine as build-stage
WORKDIR /app
COPY . /app/

FROM nginx as production-stage
RUN mkdir /app
COPY --from=build-stage /app/ /var/www/html
#RUN cd /vue && ls && cd ..
COPY nginx.conf /etc/nginx/nginx.conf
