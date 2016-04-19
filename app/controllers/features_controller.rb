class FeaturesController < ApplicationController

  # def index
  #   features = Api::Feature.get_features
  #   if features
  #     details_log = 'Successfully load features'
  #   else
  #     features = error_message('Unable to retrive Yotpo features')
  #     details_log = 'Faild to load features'
  #   end
  #   render json: features
  #   write_to_log('Elad', 'Get Features', 'default_app_key', details_log)
  # end

  def index
    @features = Api::Feature.get_features
    if @features
      details_log = 'Successfully load features'
    else
      @features = error_message('Unable to retrive Yotpo features')
      details_log = 'Faild to load features'
    end
    render :features
    write_to_log('Elad', 'Get Features', 'default_app_key', details_log)
  end

  def featuresJson
    @featuresJ = Api::Feature.get_features
    if !@featuresJ
      @featuresJ = error_message('Unable to retrive Yotpo features')
    end
    render json: @featuresJ
  end

  def featureById
    @feature = Api::Feature.find_by_id(params[:id])
    if !@feature
      @features = error_message('Unable to retrive Yotpo features')
    end
    render json: @feature
  end
end
