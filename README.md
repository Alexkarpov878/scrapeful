# Scrapeful

## TODO
- Add VCR
- Add missing tests
- Format date in metadata
- Count images added with CSS
- Count links added with JS, SPA
- Import externally referenced script/CSS to the HTML and replace images with inline base64 versions for offline viewing while maintaining the single HTML file per scrape requirement
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'scrapeful'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install scrapeful

## Usage

`./bin/scrape --metadata http://www.ikea.com`

## Docker
1. `docker build -t scrapeful .`
2. `docker run scrapeful ./bin/scrapeful https://www.ikea.ca --metadata`

## Worklog (yyyy-mm-dd hh:mm)
Time spend: 4H

Start 2022-12-03 11:00AM
Break 20 mins (Washroom & Coffee)
Finish Time: 14:20
* Minor README.md edits were made after finish time

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/scrapeful. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/scrapeful/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Scrapeful project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/scrapeful/blob/master/CODE_OF_CONDUCT.md).

