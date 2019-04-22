FROM node:8.11-stretch

COPY package.json package-lock.json /tmp/
RUN cd /tmp && npm install 
RUN mkdir -p /app && mv /tmp/node_modules /app/
WORKDIR /app
COPY . /app

FROM nginx:latest
RUN rm -fr /usr/share/nginx/html
COPY --from=0 /app /usr/share/nginx/html/
