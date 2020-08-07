FROM node:14 AS builder

WORKDIR /code

COPY package.json yarn.lock ./

RUN yarn install --non-interactive

COPY . .

RUN yarn build


FROM nginx:1.19-alpine

COPY --from=builder /code/dist /usr/share/nginx/html

COPY ./config/nginx.conf /etc/nginx/conf.d/default.conf
