module Api
  class Feature < OpenStruct
    def initialize(attributes)
      super (attributes)
    end

    def self.find_by_id(id)
      find(id)
    end

    def self.find_by_name(name)
      find(name)
    end

    def self.find(search_param)
      return Request.get_request("features/#{search_param}", 'features')
    end

    def self.get_features
      return Request.get_request('features/', 'features')
    end


  end
end