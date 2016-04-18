class AccountsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def show
    account = Api::Account.find(params[:app_key])
    if account
      details_log = 'Successfully retrived account'
    else
      account = error_message('Unable to retrive account')
      details_log = 'Faild to retrive account'
    end
    render json: account
    write_to_log('Elad', 'Get Account By APP_KEY', params[:app_key], details_log)
  end

  def show_account_features
    @features = Api::Account.get_account_features(params[:app_key])
    if @features
      details_log = 'Successfully retrived account features'
    else
      @features = error_message('Unable to retrive account features')
      details_log = 'Faild to retrive account features'
    end
    render json: @features
    write_to_log('Elad', 'Get Account Features', params[:app_key], details_log)
  end

  def enable_feature
    enabled_feature = Api::Account.enable_feature(params[:app_key], params[:id])
    if enabled_feature
      details_log = "Successfully enabled feature no.#{params[:id]}"
    else
      enabled_feature = error_message('Unable to enable feature')
      details_log = 'Faild to enable feature'
    end
    render json: enabled_feature
    write_to_log('Elad', 'Enable Feature', params[:app_key], details_log)
  end

  def disable_feature
    disabled_feature = Api::Account.disable_feature(params[:app_key], params[:id])
    if disabled_feature
      details_log = "Successfully disabled feature no.#{params[:id]}"
    else
      disabled_feature = error_message('Unable to disable feature')
      details_log = 'Faild to disable feature'
    end
    render json: disabled_feature
    write_to_log('Elad', 'Disable Feature', params[:app_key], details_log)
  end

end
