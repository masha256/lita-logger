require "lita"

module Lita
  module Handlers
    class Logger < Handler


      config :log_file
      config :enable_http_log, default: false

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
        if !Lita.config.handlers.logger.log_file || !Lita.config.handlers.logger.enable_http_log
          return
        end

        response.headers["Content-Type"] = "text/plain"

        File.open(Lita.config.handlers.logger.log_file, "r") do |f|
          response.write f.read
        end
      end

    end

    Lita.register_handler(Logger)
  end
end

