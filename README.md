# VoidLogger

VoidLogger is a logger that logs to nothing.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'void_logger'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install void_logger

## Usage

Start by require the gem:

```ruby
require 'void_logger'
```

Then you can use the logger:

```ruby
logger = VoidLogger.new
logger.info "TEST" # nothing will be logged
```

You can also include the mixin in your module/class:

```ruby
require 'void_logger

class Test
  include VoidLogger::LoggerMixin
end
```

This mixin will bring to your module/class two accessors:
- logger: You can set the logger you want and will be return by default by the mixin
- fallback: It will lookup to all ancestors to find a logger method and use it if it finds one or return a VoidLogger.new

The fallback can be reset by calling:

```ruby
t = Test.new
t.reset_fallback
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/void_logger/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
