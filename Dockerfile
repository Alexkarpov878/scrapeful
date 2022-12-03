FROM ruby:3.1.0
COPY . .
RUN bundle install
RUN chmod +x ./bin/scrapeful
ENTRYPOINT ["./bin/scrapeful"]