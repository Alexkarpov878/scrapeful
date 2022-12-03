# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'

require_relative 'scrapeful/version'
require_relative 'scrapeful/scrape'
require_relative 'scrapeful/url'
require_relative 'scrapeful/friendly_filename'
require_relative 'scrapeful/webpage'

module Scrapeful
  class Error < StandardError; end
  # Your code goes here...
end
