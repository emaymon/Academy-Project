class FeaturesController < ApplicationController
  def index
    render json: Api::Feature.get_features
  end
end
