FROM ruby:3.0-buster

ARGS RAILS_ROOT
# ARG RAILS_MASTER_KEY

ENV RAILS_ROOT $RAILS_ROOT
ENV RAILS_MASTER_KEY $RAILS_MASTER_KEY

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | \
  apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
  tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && \
  apt-get install -y \
  build-essential \
  nodejs \
  yarn \
  libpq-dev \
  postgresql-client \
  curl

RUN apt-get clean autoclean && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt /var/lib/dpkg /var/lib/cache /var/lib/log

WORKDIR ${RAILS_ROOT}

ENV RAILS_ENV 'production'

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle config set --local wihtout 'development test'

RUN bundle install --without development test 
RUN yarn install --check-files

COPY . .

RUN rm -rf spec 

# Add a script to be executed every time the container starts
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

RUN RAILS_ENV=production rake assets:precompile

# Configure the main process to run when running image
CMD ["rails", "server", "-b", "0.0.0.0"]
