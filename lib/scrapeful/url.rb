# frozen_string_literal: true

module Scrapeful
  class URL
    attr_reader :address, :errors

    def initialize(address:)
      @address = address
      @errors = []
    end

    def valid?
      uri && valid_scheme? && valid_host? && accessible?
    end

    def to_s
      uri.to_s
    end

    private

    def uri
      @uri ||= URI.parse(address).scheme.nil? ? URI.parse("https://#{address}") : URI.parse(address)
    rescue URI::InvalidURIError => e
      @errors << { message: "The URL (#{address}) is invalid. Error: #{e}." }
      false
    end

    def valid_scheme?
      return true if uri.is_a?(URI::HTTP || URI::HTTPS)

      @errors << { message: "The URL (#{address}) has an invliad scheme. Use http or https." }
      false
    end

    def valid_host?
      return true if uri && !uri.host.nil?

      @errors << { message: "The URL (#{address}) has an invliad host." }
      false
    end

    def accessible?
      return true if URI.open(uri).status == %w[200 OK]
    rescue OpenURI::HTTPError, OpenSSL::SSL::SSLError, SocketError => e
      @errors << { message: "The URL (#{address}) is not accessible. Error: #{e}." }
      false
    end
  end
end
