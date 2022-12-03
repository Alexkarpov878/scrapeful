# frozen_string_literal: true

module Scrapeful
  class Scrape
    attr_reader :urls, :metadata

    def initialize(urls:, metadata: false)
      @urls = urls
      @metadata = metadata
    end

    def run
      urls.each do |url|
        puts url
      end
    end
  end
end
