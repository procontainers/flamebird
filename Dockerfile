FROM node:lts
ENV NODE_OPTIONS=--openssl-legacy-provider
WORKDIR /app
RUN git clone https://github.com/acacode/flamebird.git
WORKDIR /app/flamebird
RUN npm install
RUN npm update
RUN npm run build
RUN npm link
WORKDIR /code

ENTRYPOINT [ "fb", "web", "-w" ]
