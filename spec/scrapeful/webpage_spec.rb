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

    describe '.links' do
      before do
        subject.source_code = '<html>
                                <body>
                                  1. Regular link:
                                  <a href="http://www.google.com">Google</a>

                                  2. Form btton:
                                  <form action="/icecreams">
                                    <label for="best_icecream">Best Icecream:</label><br>
                                    <input type="text" id="best_icecream" name="best_icecream" value="Vanilla"><br>
                                    <input type="submit" value="Submit">
                                  </form>

                                  3. Javascript Button
                                  <button onclick="myFunction()">Click me</button>
                                </body>
                              </html>'
      end
      it { expect(subject.links.count).to eq 3 }
    end
  end
end
