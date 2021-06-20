FROM ruby:2.7.3

# install dependencies (nodejs and yarn)
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install -y nodejs yarn

# creates the work directory on container
RUN mkdir -p /travels
WORKDIR /travels

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler -v 2.2.7
RUN bundle install

# copy the project to work directory
COPY . /travels
