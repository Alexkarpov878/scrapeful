FROM ruby:3.1.0
COPY . .
RUN gem install bundler
RUN bundle install
RUN chmod +x ./bin/scrapeful
ENTRYPOINT ["./bin/scrapeful"]