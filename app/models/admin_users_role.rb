class AdminUsersRole < ActiveRecord::Base
  belongs_to :AdminUser
  belongs_to :Role

  validates :admin_user_id, presence: true
  validates :role_id, presence: true
  validates_uniqueness_of :admin_user_id, :scope => :role_id

end