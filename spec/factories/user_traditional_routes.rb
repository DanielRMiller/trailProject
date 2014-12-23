FactoryGirl.define do
  factory :user_traditional_route, :class => 'UserTraditionalRoutes' do
    user_id {FactoryGirl.create(:user).id}
    traditional_route_id {FactoryGirl.create(:traditional_route).id}
    complete 1
  end

end
