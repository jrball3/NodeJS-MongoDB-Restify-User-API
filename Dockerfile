FROM node:11-alpine

RUN apk --no-cache --virtual build-dependencies add python make g++

COPY /app/package.json /app/package.json
COPY /app/package-lock.json /app/package-lock.json

WORKDIR /app/

RUN npm install

COPY /app/ /app/

EXPOSE 3000

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.2.1/wait /wait
RUN chmod +x /wait

ENTRYPOINT ["/app/entrypoint.sh"]
