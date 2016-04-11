class ActivityType < ActiveRecord::Base
  has_many :AdminUser, :through => :Log
  has_many :Log
  validates :name, presence: true, uniqueness: true

end