require "lita"

module Lita
  module Handlers
    class Logger < Handler


      def self.default_config(config)
        config.log_file = nil
      end

      route(/.*/, :logger)

      def logger(response)
        if Lita.config.handlers.logger.log_file && !response.message.source.private_message
          File.open(Lita.config.handlers.logger.log_file, 'a') do |f|
            f.puts "[#{Time.now}] [#{response.user.name} in #{response.message.source.room}] #{response.message.body}"
          end
        end
      end

    end

    Lita.register_handler(Logger)
  end
end
