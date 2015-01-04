class UserTraditionalRoutes < ActiveRecord::Base
  validates :user, :traditional_route, :complete, presence:true
  validates :complete, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 1 }
  belongs_to :user
  belongs_to :traditional_route
  validates_uniqueness_of :traditional_route, :scope => :user
end
