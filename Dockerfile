FROM picoded/ubuntu-openjdk-8-jdk
MAINTAINER Ishmael Ahmed <ishmael.ahmed@readindplus.com>

ENV MOUNT /opt/code
ENV HUB localhost


RUN apt-get -y update
RUN apt-get install -y -q software-properties-common wget git
RUN add-apt-repository -y ppa:mozillateam/firefox-next

RUN wget -qO- https://deb.nodesource.com/setup_4.x | sudo bash -
RUN sudo apt-get install -y nodejs

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list
RUN apt-get update -y
RUN apt-get install -y -q \
  firefox \
  google-chrome-stable \
  nodejs \
  xvfb \  
  xfonts-100dpi \
  xfonts-75dpi \
  xfonts-scalable \
  xfonts-cyrillic 

RUN useradd seleuser \ 
--shell /bin/bash  \
--create-home \
  && usermod -a -G sudo seleuser \
  && gpasswd -a seleuser video \
  && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && echo 'seleuser:secret' | chpasswd

ADD ./scripts/ /home/root/scripts

# Global Dependencies
# bower polymer polymer-cli web-component-tester git+https://github.com/marcelmeulemans/wct-junit-reporter.git
RUN npm install -g \
  bower \
  polymer \
  polymer-cli \
  web-component-tester \   
  git+https://github.com/marcelmeulemans/wct-junit-reporter.git 


# Adding file structure
VOLUME $MOUNT  
WORKDIR /opt/code

EXPOSE 4444 5999 2000
ENTRYPOINT ["sh", "/home/root/scripts/start.sh"]
