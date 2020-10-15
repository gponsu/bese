FROM ruby:2.7.2

ENV STORAGE_PATH=/usr/local/storage
WORKDIR ${STORAGE_PATH}

COPY . $STORAGE_PATH

EXPOSE 3305

CMD ["ruby", "server.rb"]