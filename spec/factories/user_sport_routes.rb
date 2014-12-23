FactoryGirl.define do
  factory :user_sport_route, :class => 'UserSportRoutes' do
    user_id {FactoryGirl.create(:user).id}
    sport_route_id {FactoryGirl.create(:sport_route).id}
    complete 1
  end

end
