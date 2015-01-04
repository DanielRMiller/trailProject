require 'rails_helper'

RSpec.describe UserBoulderRoutes, :type => :model do
  it "has a valid factory" do
    subject = FactoryGirl.create(:user_boulder_route)
    expect(subject).to be_valid
  end
  it "is invalid without a user" do
    subject = FactoryGirl.build(:user_boulder_route, user_id:nil)
    expect(subject).to_not be_valid
  end
  it "is invalid without a sport_route" do
    subject = FactoryGirl.build(:user_boulder_route, boulder_route_id:nil)
    expect(subject).to_not be_valid
  end
  it "is invalid without a 'complete' value" do
    subject = FactoryGirl.build(:user_boulder_route, complete:nil)
    expect(subject).to_not be_valid
  end
  it "is invalid a 'complete' value grater than 1" do
    subject = FactoryGirl.build(:user_boulder_route, complete:2)
    expect(subject).to_not be_valid
  end
  it "is invalid a 'complete' value less than 0" do
    subject = FactoryGirl.build(:user_boulder_route, complete:-1)
    expect(subject).to_not be_valid
  end
  it "is invalid if matching entry already exists" do
    user = FactoryGirl.create(:user)
    boulder_route = FactoryGirl.create(:boulder_route)
    subject = FactoryGirl.create(:user_boulder_route, user_id: user.id, boulder_route_id: boulder_route.id)
    expect(subject).to be_valid
    subject2 = FactoryGirl.build(:user_boulder_route, user_id: user.id, boulder_route_id: boulder_route.id)
    expect(subject2).to_not be_valid
  end
  it "is valid when user addes many routes" do
    user = FactoryGirl.create(:user)
    subject = FactoryGirl.create(:user_boulder_route, user_id: user.id)
    expect(subject).to be_valid
    subject2 = FactoryGirl.build(:user_boulder_route, user_id: user.id)
    expect(subject2).to be_valid
  end
end
