require File.expand_path('../faraday/raise_http_exception.rb', __FILE__)
require File.expand_path('../client_response.rb', __FILE__)
require 'active_support/all'

module KSequencing
  # :nodoc:
  class Connection
    def get(path, options = {})
      response = connection.get do |request|
        request.url(path)
        request.headers['Content-Type'] = 'application/json'
        request.headers['Authorization'] = options[:token] unless options[:token].nil?
        request.params = options
      end
      Response.new(data(response), true, response.status, 'success', meta(response), total(response))
    rescue Error, Faraday::Error => e
      handle_error(e)
    end

    def post(path, options = {}, query_params = {})
      response = connection.post do |request|
        request.path = path
        request.headers['Content-Type'] = 'application/json'
        request.headers['Authorization'] = options[:token] unless options[:token].nil?
        request.params = query_params
        request.body = options unless options.empty?
      end
      Response.new(data(response), true, response.status)
    rescue Error, Faraday::Error => e
      handle_error(e)
    end

    private

    def connection
      @connection ||= Faraday::Connection.new(KSequencing.service_url) do |connection|
        connection.request :url_encoded
        connection.request :json
        connection.response :json
        connection.use KSequencing::FaradayMiddleware::RaiseHttpException
        connection.use :gzip
        connection.adapter Faraday.default_adapter
      end
    end

    def meta(response)
      response.body['meta']
    end

    def total(response)
      meta(response)['count'] if meta(response).present?
    end

    def data(response)
      response.body['data']
    end

    def handle_error(exception)
      if exception.is_a?(Faraday::ConnectionFailed)
        code = KSequencing.connection_failed_code
        message = 'Connection Failed'
      else
        code = exception.to_s.partition(':').first
        message = exception.to_s.partition(':').last
      end

      Response.new(nil, false, code, message, 0)
    end
  end
end
