class Log < ActiveRecord::Base
  belongs_to :AdminUser
  belongs_to :ActivityType
  validates :admin_user_id, :activity_type_id, presence: true

end