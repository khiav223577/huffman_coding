# huffman_coding

[![Gem Version](https://img.shields.io/gem/v/huffman_coding.svg?style=flat)](http://rubygems.org/gems/huffman_coding)
[![Build Status](https://travis-ci.com/khiav223577/huffman_coding.svg?branch=master)](https://travis-ci.org/khiav223577/huffman_coding)
[![RubyGems](http://img.shields.io/gem/dt/huffman_coding.svg?style=flat)](http://rubygems.org/gems/huffman_coding)
[![Code Climate](https://codeclimate.com/github/khiav223577/huffman_coding/badges/gpa.svg)](https://codeclimate.com/github/khiav223577/huffman_coding)
[![Test Coverage](https://codeclimate.com/github/khiav223577/huffman_coding/badges/coverage.svg)](https://codeclimate.com/github/khiav223577/huffman_coding/coverage)

## Supports
- Ruby 1.8 ~ 2.7

## Installation

```ruby
gem 'huffman_coding'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install huffman_coding

## Usage

### Encode
```rb
binary, last_byte_bits, mapping = HuffmanCoding.encode('A short test.'.each_char)
binary
# => "6\x88BwV"

last_byte_bits
# => 8

mapping
# => {"e"=>"111", "."=>"110", "t"=>"10", " "=>"011", "s"=>"010", "A"=>"0011", "h"=>"0010", "o"=>"0001", "r"=>"0000"}
```

### Decode
```rb
binary = "6\x88BwV"
last_byte_bits = 8
mapping = {"e"=>"111", "."=>"110", "t"=>"10", " "=>"011", "s"=>"010", "A"=>"0011", "h"=>"0010", "o"=>"0001", "r"=>"0000"}

HuffmanCoding.decode(binary, last_byte_bits, mapping)
# => 'A short test.'
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/khiav223577/huffman_coding. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

