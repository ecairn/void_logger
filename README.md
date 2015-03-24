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

Start by requiring the gem:

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
require 'void_logger'

class Test
  include VoidLogger::LoggerMixin
end
```

This mixin brings two members to your module/class:
- fallback_logger: It will look up all the ancestors to find a logger method and use it if it finds one or return a VoidLogger.new
- logger: The logger you can use in the class you mix VoidLogger::LoggerMixin into. Return the fallback logger (as defined above) unless you explicitly set a logger with the logger= method.

You can reset the fallback logger by calling:

```ruby
t = Test.new
t.reset_fallback_logger
```

Resetting the fallback logger can be useful when a new logger was defined on one of the ancestors.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/void_logger/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
