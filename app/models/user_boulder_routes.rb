class UserBoulderRoutes < ActiveRecord::Base
  validates :user, :boulder_route, :complete, presence:true
  validates :complete, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 1 }
  belongs_to :user
  belongs_to :boulder_route
  validates_uniqueness_of :boulder_route, :scope => :user

end
