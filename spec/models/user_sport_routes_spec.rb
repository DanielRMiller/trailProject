require 'rails_helper'

RSpec.describe UserSportRoutes, :type => :model do
  it "has a valid factory" do
    subject = FactoryGirl.create(:user_sport_route)
    expect(subject).to be_valid
  end
  it "is invalid without a user" do
    subject = FactoryGirl.build(:user_sport_route, user_id:nil)
    expect(subject).to_not be_valid
  end
  it "is invalid without a sport_route" do
    subject = FactoryGirl.build(:user_sport_route, sport_route_id:nil)
    expect(subject).to_not be_valid
  end
  it "is invalid without a 'complete' value" do
    subject = FactoryGirl.build(:user_sport_route, complete:nil)
    expect(subject).to_not be_valid
  end
  it "is invalid a 'complete' value grater than 1" do
    subject = FactoryGirl.build(:user_sport_route, complete:2)
    expect(subject).to_not be_valid
  end
  it "is invalid a 'complete' value less than 0" do
    subject = FactoryGirl.build(:user_sport_route, complete:-1)
    expect(subject).to_not be_valid
  end
end
