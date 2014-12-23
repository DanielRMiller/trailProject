FactoryGirl.define do
  factory :user_boulder_route, :class => 'UserBoulderRoutes' do
    user_id {FactoryGirl.create(:user).id}
    boulder_route_id {FactoryGirl.create(:boulder_route).id}
    complete 1
  end

end
