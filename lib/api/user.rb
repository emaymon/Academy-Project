module Api
  class User < OpenStruct

    def initialize(attributes)
      super (attributes)
    end

    def self.find(app_key)
      attributes = Request.get_request("users/#{app_key}", 'user')
      new(attributes)
    end

  end
end