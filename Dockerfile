FROM node:lts

RUN apt-get update && apt-get install -qqy apt-transport-https gconf-service libasound2 libatk1.0-0 libatk-bridge2.0-0 \
 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 \
 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 \
 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 \
 lsb-release xdg-utils wget && \
 curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
 echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
 apt-get update && apt-get -qqy install yarn && \
 rm -rf /var/lib/apt/lists/* && \
 yarn --version && \
 chown node:node /usr/local/bin

COPY entrypoint /entrypoint

RUN groupadd -g 515 app && \
    useradd -g 515 -u 515 --system --create-home app

USER app

EXPOSE 8080

WORKDIR /code

ENTRYPOINT ["/entrypoint"]
