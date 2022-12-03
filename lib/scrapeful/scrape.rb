# frozen_string_literal: true

module Scrapeful
  class Scrape
    attr_reader :urls, :metadata

    def initialize(urls:, metadata: false)
      @urls = urls
      @metadata = metadata
    end

    def run
      urls.each do |raw_url|
        url = Scrapeful::URL.new(address: raw_url)

        unless url.valid?
          puts url.errors.map { |error| error[:message] }
          next
        end

        puts url
      end
    end
  end
end
