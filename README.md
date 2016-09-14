# Ydf

This library is a converter of geo data format for YDF (YOLP Data Format) on Ruby. This library is experimental and unstable.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ydf'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ydf

## Usage

```
require "ydf"

kml = open("kml_linestring.kml", &:read)
puts kml

doc = YDF::Convert::KML.new().parse(kml)

ydf = YDF::Convert::YDFXML.new().generate(doc)
puts ydf
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/niwasawa/ydf-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Status

[![Gem Version](https://badge.fury.io/rb/ydf.svg)](https://badge.fury.io/rb/ydf)

