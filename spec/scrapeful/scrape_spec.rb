# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe Scrapeful::Scrape do
  subject { described_class.new(urls:, metadata:) }

  describe '.run' do
    let(:urls) { %w[https://www.ikea.ca] }
    let(:metadata) { true }

    it { expect { subject.run }.to_not raise_error }
  end
end
