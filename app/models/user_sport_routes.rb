class UserSportRoutes < ActiveRecord::Base
  validates :user, :sport_route, :complete, presence:true
  validates :complete, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 1 }
  belongs_to :user
  belongs_to :sport_route
end
