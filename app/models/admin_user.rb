class AdminUser < ActiveRecord::Base
  has_many :Role, :through => :AdminUsersRole
  has_many :Log
  validates :name, presence: true
  validates :password, presence: true


  def authenticate(password)
    return AdminUser.find_by_name_and_password(name, password)
  end

end