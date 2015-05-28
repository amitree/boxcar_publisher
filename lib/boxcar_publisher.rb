require 'faraday'
require 'faraday_middleware'
require 'date'

class BoxcarPublisher
  class Config
    %w(access_key secret_key).each do |var|
      eval <<-BLOCK
        def #{var} val
          BoxcarPublisher.#{var} = val
        end
      BLOCK
    end
  end

  class << self
    attr_accessor :access_key, :secret_key

    def setup &block
      Config.new.instance_eval &block
      nil
    end

    def _conn
      @conn ||= Faraday.new(url: 'https://boxcar-api.io/api') do |conn|
        conn.basic_auth access_key, secret_key
        conn.request :json
        conn.response :json
        conn.use Faraday::Response::RaiseError
        conn.adapter Faraday.default_adapter
      end
    end
  end

  class Push
    attr_accessor :id, :url

    def initialize options
      result = BoxcarPublisher._conn.post 'push', options
      @id = result.body['ok']
      @url = result.headers['Location']
    end

    def state
      result = BoxcarPublisher._conn.get "push/#{id}"
      json = result.body
      {}.tap do |res|
        json.each do |key, value|
          value = (DateTime.parse(value).to_time rescue value) if key =~ /_at\z/
          res[key.to_sym] = value
        end
      end
    end
  end
end
