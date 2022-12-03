# frozen_string_literal: true

module Scrapeful
  class FriendlyFilename
    attr_reader :url

    def initialize(for_url:)
      @url = for_url.to_s
    end

    def to_s
      name = url.gsub(%r{^https?://(www.)?}, '') # remove https:// or http://
                .chomp('/')                 # remove trailing slash
                .gsub(/[^.\w\s_-]+/, '-')   # replace characters other than letters / digits with dashes
                .gsub(/\s+/, '_')           # replace spaces with underscores
                .downcase                   # downcase

      # add .html unless already present
      name += '.html' unless name.end_with?('.html') || name.end_with?('.html')
      name
    end
  end
end
