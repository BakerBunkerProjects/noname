FROM --platform=${TARGETPLATFORM} node:alpine
#FROM node:alpine
RUN npm install pm2 -g

WORKDIR /app

RUN rm -rf noname-server.exe .git .github README.md Dockerfile .gitignore .dockerignore
RUN npm install ws body-parser express minimist
COPY . .

EXPOSE 8081
EXPOSE 8082

CMD [ "pm2-runtime", "process.yml" ]