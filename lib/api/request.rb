require 'rest-client'
require 'json'
module Api
  class Request
    cattr_accessor :utoken

    def self.configure
      yield self
    end

    def self.set_utoken
      self.configure do |x| x.utoken = ENV['token'] end
    end

    def self.get_request(url_direct, spec)
      response = RestClient.get "https://staging-api.yotpo.com/#{url_direct}?utoken=#{utoken}"
      return parse_response(response, 'get', spec)
    end

    def self.post_request(url_direct, spec, params)
      response = RestClient.post "https://staging-api.yotpo.com/#{url_direct}?utoken=#{utoken}" , params
      return parse_response(response, 'post', spec)
    end

    def self.delete_request(url_direct, spec)
      response = RestClient.delete "https://staging-api.yotpo.com/#{url_direct}?utoken=#{utoken}"
      return parse_response(response, 'delete', spec)
    end

    def self.parse_response(response, req_type, spec)
      parsed_response = JSON.parse(response)
      status_message = check_status(parsed_response['status'])
      if status_message == 'OK' then
        case req_type
          when 'get'
            hash_response = parsed_response['response']
            return hash_response[spec] #return response body
          when 'post', 'delete'
            return parsed_response #delete & post return empty 'OK' status message
        end
      else #error response - return as json
        return status_message # return response[status][message]
      end
    end

    def self.check_status(status)
      case status['code']
        when 200
          return 'OK'
        when 401
          return status['message']
        when 404
          return status['message']
      end
    end

  end
end