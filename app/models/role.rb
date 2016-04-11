class Role < ActiveRecord::Base
  has_many :AdminUser, :through => :AdminUsersRole
  validates :name, presence: true, uniqueness: true


end