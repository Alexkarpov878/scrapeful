# frozen_string_literal: true

module Scrapeful
  class Webpage
    attr_accessor :url, :friendly_filename

    def initialize(url:)
      @url = url.to_s
      @friendly_filename = Scrapeful::FriendlyFilename.new(for_url: url).to_s
    end

    def source_code
      @source_code ||= URI.open(url).read
    end

    def scrape
      path = File.join(Dir.pwd, friendly_filename)
      File.open(path, 'w') do |file|
        file.write(source_code)
      end
    end
  end
end
