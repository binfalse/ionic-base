FROM node:slim

WORKDIR /usr/app
ENV ANDROID_HOME=/usr/lib/android-sdk

RUN apt -qq update \
 && apt -qq install -y \
    procps \
    git \
    wget \
    unzip \
    libnss3 \
    gnupg \
    default-jdk \
    default-jre \
    ca-certificates \
    android-sdk \
    android-sdk-build-tools \
    android-sdk-platform-tools \
    sdkmanager \
    --no-install-recommends \
 && rm -rf /var/lib/{apt,dpkg,cache,log}

RUN wget -O /etc/apt/trusted.gpg.d/chrome.asc https://dl-ssl.google.com/linux/linux_signing_key.pub \
 && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list

RUN apt -qq update \
 && apt -qq install -y \
    google-chrome-stable \
    --no-install-recommends \
 && rm -rf /var/cache /var/lib/{apt,dpkg,cache,log}

RUN npm i -g @ionic/cli \
 && npm cache clear --force \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /root/.npm/_log


