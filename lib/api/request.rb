require 'rest-client'
require 'json'
module Api
  class Request
    cattr_accessor :utoken

    def self.get_request(url_direct, spec)
      return make_request(:get, "https://staging-api.yotpo.com/#{url_direct}?utoken=#{utoken}", {}, spec)
    end

    def self.post_request(url_direct, spec, params)
      return make_request(:post, "https://staging-api.yotpo.com/#{url_direct}?utoken=#{utoken}", params, spec)
    end

    def self.delete_request(url_direct, spec)
      return make_request(:delete, "https://staging-api.yotpo.com/#{url_direct}?utoken=#{utoken}", {}, spec)
    end

    def self.make_request(type, url, body, spec)
      begin
        response = RestClient.send(type, url, body)
        return parse_response(response, type, spec)
      rescue
        return false
      end
    end

    def self.parse_response(response, req_type, spec)
      begin
        parsed_response = JSON.parse(response)
        if parsed_response['status']['code'] == 200 then
          case req_type
            when :get
              hash_response = parsed_response['response']
              return hash_response[spec] #return response body
            when :post, :delete
              return parsed_response #delete & post return empty 'OK' status message
          end
        else #error response - return as json
          return false
        end
      rescue
        return false
      end
    end

    def self.configure
      yield self
    end

    def self.set_utoken
      self.configure do |x| x.utoken = ENV['token'] end
    end

  end
end