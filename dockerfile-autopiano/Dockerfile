FROM node:lts-alpine

COPY AutoPiano /AutoPiano

WORKDIR /AutoPiano

RUN npm install && \
  npm run build

EXPOSE 5000

CMD [ "node", "build/dev-server.js" ]
