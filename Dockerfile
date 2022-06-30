FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm install && npm install pm2 -g && pm2 link 44ahpi4v79ureap drbnfobrl2hn8hm && pm2 start index.js && pm2 save && pm2 logs && pm2 monit

COPY . .

EXPOSE 5000

CMD ["npm", "start"]
