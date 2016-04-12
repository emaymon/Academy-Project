module Api
  class Account < OpenStruct

    def initialize(attributes)
      super (attributes)
    end

    def self.find(app_key)
      return Request.get_request("apps/#{app_key}", 'app')
    end

    def self.get_account_features(app_key)
      return Request.get_request("apps/#{app_key}/features", 'features')
    end

    def self.enable_feature(app_key, feature_id)
      params = {'id': feature_id}
      return Request.post_request("apps/#{app_key}/features", 'features', params)
    end

    def self.disable_feature(app_key, feature_id)
      return Request.delete_request("apps/#{app_key}/features/#{feature_id}", 'features')
    end

  end
end