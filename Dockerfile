FROM adoptopenjdk/openjdk8:slim

ENV MOUNT /opt/code
ENV HUB localhost

RUN apt-get -y update \
  && apt-get install -y -q \
  software-properties-common \
  wget \
  curl \
  git
RUN add-apt-repository -y ppa:mozillateam/firefox-next

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list
RUN apt-get update -y \
  && apt-get install -y -q \
  firefox \
  google-chrome-stable \
  xvfb \
  xfonts-100dpi \
  xfonts-75dpi \
  xfonts-scalable \
  xfonts-cyrillic

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs


# Adding file structure
VOLUME $MOUNT
WORKDIR /opt/code

EXPOSE 4444 5999 2000
