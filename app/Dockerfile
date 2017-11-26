FROM ruby:2.7.2

ENV APP_PATH=/usr/local/bese
WORKDIR ${APP_PATH}

COPY Gemfile* $APP_PATH
RUN bundle install

COPY . $APP_PATH

CMD ["ruby", "application.rb"]