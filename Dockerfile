FROM node:12.19.1-alpine AS builder
COPY . ./MyApp
WORKDIR /MyApp
RUN npm i
RUN $(npm bin)/ng build --prod
FROM nginx:1.15.8-alpine
COPY --from=builder /MyApp/dist/MyApp/ /usr/share/nginx/html
