FROM ruby:2.5.1

RUN apt-get update \
    && apt-get install -yq apt-transport-https

RUN apt-get install -yq \
      libpq-dev \
      jq

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -yq nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -yq yarn

# install java 8
#
RUN apt-get update \
    && apt-get install -yq openjdk-8-jre openjdk-8-jre-headless openjdk-8-jdk openjdk-8-jdk-headless \
    && apt-get install -yq bzip2 libgconf-2-4

# install firefox
#
RUN FIREFOX_URL="https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US" \
  && ACTUAL_URL=$(curl -Ls -o /dev/null -w %{url_effective} $FIREFOX_URL) \
  && curl --silent --show-error --location --fail --retry 3 --output /tmp/firefox.tar.bz2 $ACTUAL_URL \
  && tar -xvjf /tmp/firefox.tar.bz2 -C /opt \
  && ln -s /opt/firefox/firefox /usr/local/bin/firefox \
  && apt-get install -y libgtk3.0-cil-dev libasound2 libasound2 libdbus-glib-1-2 libdbus-1-3 \
  && rm -rf /tmp/firefox.* \
  && firefox --version

# install geckodriver

RUN export GECKODRIVER_LATEST_RELEASE_URL=$(curl https://api.github.com/repos/mozilla/geckodriver/releases/latest | jq -r ".assets[] | select(.name | test(\"linux64\")) | .browser_download_url") \
     && curl --silent --show-error --location --fail --retry 3 --output /tmp/geckodriver_linux64.tar.gz "$GECKODRIVER_LATEST_RELEASE_URL" \
     && cd /tmp \
     && tar xf geckodriver_linux64.tar.gz \
     && rm -rf geckodriver_linux64.tar.gz \
     && mv geckodriver /usr/local/bin/geckodriver \
     && chmod +x /usr/local/bin/geckodriver \
     && geckodriver --version

RUN mkdir /app
WORKDIR /app

ENV RAILS_ENV test

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install -j20

COPY . ./

RUN yarn install
