require "lita"

module Lita
  module Handlers
    class Logger < Handler


      def self.default_config(config)
        config.log_file = nil
      end

      route(/.*/, :logger)

      def logger(response)
        if Lita.config.handlers.logger.log_file
          File.open(Lita.config.handlers.logger.log_file, 'a') do |f|
            f.write("Message: " + response.message.body)
          end
        end

      end

    end

    Lita.register_handler(Logger)
  end
end
