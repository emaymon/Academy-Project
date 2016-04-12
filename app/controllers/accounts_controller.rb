class AccountsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def show
    render json: Api::Account.find(params[:app_key])
  end

  def show_account_features
    render json: Api::Account.get_account_features(params[:app_key])
  end

  def enable_feature
    render json: Api::Account.enable_feature(params[:app_key], params[:id])
  end

  def disable_feature
    render json: Api::Account.disable_feature(params[:app_key], params[:id])
  end
end
