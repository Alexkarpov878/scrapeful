# frozen_string_literal: true

module Scrapeful
  class Selectors
    LINKS_V1 = %w[
      //a/@href
      //button/@onclick
      //input[@type='submit']
      //input[@type='button']
      //input[@type='reset']
    ].join('|')

    IMAGES_V1 = %w[
      //meta[@property="og:image"]
      //meta[@itemprop="image"]
      //img
    ].join('|')
  end
end
