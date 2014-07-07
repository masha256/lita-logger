require "lita"

module Lita
  module Handlers
    class Logger < Handler


      def self.default_config(config)
        config.log_file = nil
      end

      route(/.*/, :logger)

      http.get "/chat_log", :chat_log

      def logger(response)
        if !Lita.config.handlers.logger.log_file || response.message.source.private_message || !response.message.body
          return
        end

        File.open(Lita.config.handlers.logger.log_file, 'a') do |f|
          f.puts "[#{Time.now}] [#{response.user.name} in #{response.message.source.room}] #{response.message.body}"
        end
      end

      def chat_log(request, response)
        if !Lita.config.handlers.logger.log_file
          return
        end

        response.headers["Content-Type"] = "text/plain"
        response.headers.delete('Transfer-Encoding')

        File.open(Lita.config.handlers.logger.log_file, "r") do |f|
          # while (line = f.gets)
          #   response.body << line
          # end
          response.body << file.read
        end
      end

    end

    Lita.register_handler(Logger)
  end
end

