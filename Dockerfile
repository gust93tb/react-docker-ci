FROM node:14-stretch-slim as build
WORKDIR /app
COPY . /app
RUN npm cache clean --force
RUN npm install -g npm@latest --force
RUN npm cache clean --force
RUN npm audit fix
RUN npm run build 


FROM nginx:latest
COPY --from=build /app/build /usr/share/nginx/html
