FROM ruby:2.7

RUN apt-get update && \
    apt-get install -y net-tools

# Install depends.
RUN apt-get install -y x11vnc xvfb fluxbox wget
# Install Chrome
#RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
#    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

#RUN apt-get update && apt-get -y install google-chrome-stable


###
#ENV DEBIAN_FRONTEND noninteractive
ENV CHROMIUM_DRIVER_VERSION 83.0.4103.39

# Install dependencies & Chrome

RUN apt-get update && apt-get -y --no-install-recommends install zlib1g-dev liblzma-dev wget xvfb unzip libnss3 nodejs \
 && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -  \
 && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list \
 && apt-get update && apt-get -y --no-install-recommends install google-chrome-stable \
 && rm -rf /var/lib/apt/lists/*

# Install Chrome driver
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/$CHROMIUM_DRIVER_VERSION/chromedriver_linux64.zip \
    && unzip /tmp/chromedriver.zip chromedriver -d /usr/bin/ \
    && rm /tmp/chromedriver.zip \
    && chmod ugo+rx /usr/bin/chromedriver

###

ENV APP_HOME /app
ENV HOME /root

RUN mkdir /build

COPY ./Gemfile /build/Gemfile
COPY ./entrypoint.sh /build/entrypoint.sh


RUN chmod 755 /build/entrypoint.sh && echo "Docker starting :)" > /var/log/test.log

WORKDIR /build

RUN bundle install

ENTRYPOINT /build/entrypoint.sh