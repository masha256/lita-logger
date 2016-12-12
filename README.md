# lita-logger

**lita-logger** is a handler for [Lita](https://github.com/jimmycuadra/lita) to log all chat messages to a file.

## Installation

Add lita-logger to your Lita instance's Gemfile:

``` ruby
gem "lita-logger"
```

## Configuration

This plugin requires the path to the log file.

``` ruby
Lita.configure do |config|
  config.handlers.logger.log_file = "/tmp/lita_chat.log"
  config.handlers.logger.enable_http_log = true
end
```

## License

[MIT](http://opensource.org/licenses/MIT)
