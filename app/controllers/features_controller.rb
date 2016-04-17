class FeaturesController < ApplicationController

  def index
    features = Api::Feature.get_features
    if features
      details_log = 'Successfully load features'
    else
      features = error_message('Unable to retrive Yotpo features')
      details_log = 'Faild to load features'
    end
    render json: features
    write_to_log('Elad', 'Get Features', 'default_app_key', details_log)
  end

end
