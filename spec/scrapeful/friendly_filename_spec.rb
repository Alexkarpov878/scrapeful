# frozen_string_literal: true

RSpec.describe Scrapeful::FriendlyFilename do
  subject { described_class.new(for_url:) }

  describe '.to_s' do
    context 'starting with http://' do
      let(:for_url) { 'http://www.ikea.ca' }
      it { expect(subject.to_s).to eq('ikea.ca.html') }
    end

    context 'ending with a /' do
      let(:for_url) { 'https://www.ikea.ca/' }
      it { expect(subject.to_s).to eq('ikea.ca.html') }
    end

    context 'starting with https://' do
      let(:for_url) { 'https://www.ikea.ca' }
      it { expect(subject.to_s).to eq('ikea.ca.html') }
    end

    context 'ending with .html' do
      let(:for_url) { 'https://www.ikea.ca/sofas/index.html' }
      it { expect(subject.to_s).to eq('ikea.ca-sofas-index.html') }
    end

    context 'with a URL with a query string' do
      let(:for_url) { 'https://www.ikea.ca/en-ca/p/sofa-bed?color=blue' }

      it { expect(subject.to_s).to eq 'ikea.ca-en-ca-p-sofa-bed-color-blue.html' }
    end

    context 'with a URL with a query string and a hash' do
      let(:for_url) { 'https://www.ikea.ca/en-ca/p/sofa-bed-3-seat/#/702.729.86?color=blue' }

      it { expect(subject.to_s).to eq 'ikea.ca-en-ca-p-sofa-bed-3-seat-702.729.86-color-blue.html' }
    end

    context 'with a URL with a query string containing spaces' do
      let(:for_url) { 'https://www.ikea.ca/en-ca/search?query=The best sofa in Sweeden' }
      it { expect(subject.to_s).to eq 'ikea.ca-en-ca-search-query-the_best_sofa_in_sweeden.html' }
    end
  end
end
