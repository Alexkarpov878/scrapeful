# frozen_string_literal: true

RSpec.describe Scrapeful::Webpage do
  subject { described_class.new(url:) }

  let(:url) { 'https://www.example.com' }

  context 'when page is valid' do
    describe '.source_code' do
      it { expect(subject.source_code).to include('<h1>Example Domain</h1>') }
    end

    describe '.scrape' do
      # TODO: Add tests in /tmp folder
      it { expect { subject.scrape }.to_not raise_error }
    end
  end
end
