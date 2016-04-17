class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def write_to_log(admin, activity, app_key, details)
    Log.create(admin_user_id: AdminUser.find_by_name(admin).id,
               activity_type_id: ActivityType.find_by_name(activity).id,
               app_key: app_key, details: details)
  end

  def error_message(message)
    return {
        'status': {
            'code': 404,
            'message': "#{message}"
        }
    }
  end
end