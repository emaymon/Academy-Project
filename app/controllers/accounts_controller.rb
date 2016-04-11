class AccountsController < ApplicationController
  def show
    render json: Api::Account.find(params[:app_key])
  end
end
