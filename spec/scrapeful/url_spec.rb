# frozen_string_literal: true

RSpec.describe Scrapeful::URL do
  subject { described_class.new(address:) }

  describe '.to_s' do
    let(:address) { 'https://www.ikea.ca' }
    it { expect(subject.to_s).to eq(address) }

    context 'when address has no scheme' do
      let(:address) { 'www.ikea.ca' }
      it { expect(subject.to_s).to eq("https://#{address}") }
    end

    context 'when address has no scheme and no www' do
      let(:address) { 'ikea.ca' }
      it { expect(subject.to_s).to eq("https://#{address}") }
    end
  end

  describe '.valid?' do
    context 'when the address starts with http' do
      let(:address) { 'http://example.com' }

      it 'returns true' do
        expect(subject.valid?).to eq(true)
      end
    end

    context 'when the address starts with www' do
      let(:address) { 'www.google.com' }

      it 'returns true' do
        expect(subject.valid?).to eq(true)
      end
    end

    context 'when the address invalid' do
      let(:address) { 'hello world' }

      it 'returns an error message' do
        expect(subject.valid?).to eq(false)
        expect(subject.errors).to include({ message: "The URL (hello world) is invalid. Error: bad URI(is not URI?): \"#{address}\"." })
      end
    end

    context 'when the address to an unsupported scheme' do
      let(:address) { 'ftp://example.com' }

      it 'returns an error message' do
        expect(subject.valid?).to eq(false)
        expect(subject.errors).to include({ message: "The URL (#{address}) has an invliad scheme. Use http or https." })
      end
    end

    context 'when the address is forbidden' do
      let(:address) { 'https://www.artstation.com' }

      it 'returns an error message' do
        expect(subject.valid?).to eq(false)
        expect(subject.errors).to include({ message: "The URL (#{address}) is not accessible. Error: 403 Forbidden." })
      end
    end

    context 'when the address is unresolveable or temporary failure in name resolution' do
      let(:address) { 'http://UnresolvableDomain.com/' }

      it 'returns an error message' do
        expect(subject.valid?).to eq(false)
        expect(subject.errors.map { |e| e[:message] }).to include(match(/is not accessible/))
      end
    end
  end
end
