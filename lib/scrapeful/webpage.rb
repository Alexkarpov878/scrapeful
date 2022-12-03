# frozen_string_literal: true

module Scrapeful
  class Webpage
    attr_accessor :url, :friendly_filename, :source_code

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

    def print_metadata
      puts metadata
    end

    def parsed_html
      Nokogiri::HTML(source_code)
    end

    def links
      parsed_html.xpath(Scrapeful::Selectors::LINKS_V1)
    end

    def images
      parsed_html.xpath(Scrapeful::Selectors::IMAGES_V1)
    end

    def metadata
      [
        "site :#{url}",
        "num_links: #{links.count}",
        "images: #{images.count}",
        "last_fetch: #{File.file?(friendly_filename) ? File.mtime(friendly_filename) : Time.now}"
      ]
    end
  end
end
