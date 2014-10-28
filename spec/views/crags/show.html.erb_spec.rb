require 'rails_helper'

RSpec.describe "crags/show", :type => :view do
  before(:each) do
    @crag = assign(:crag, Crag.create!(
      :territory => nil,
      :name => "Name",
      :longitude => "9.99",
      :latitude => "9.99",
      :zoom => 1,
      :directions => "MyText",
      :description => "MyText",
      :history => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
