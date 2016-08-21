require 'rails_helper'

RSpec.describe "positions/index", type: :view do
  before(:each) do
    assign(:positions, [
      Position.create!(
        :user_id => 2,
        :title => "Title",
        :position_description => "MyText",
        :location => "Location",
        :special_requirement => "Special Requirement",
        :note => "MyText",
        :files => "Files"
      ),
      Position.create!(
        :user_id => 2,
        :title => "Title",
        :position_description => "MyText",
        :location => "Location",
        :special_requirement => "Special Requirement",
        :note => "MyText",
        :files => "Files"
      )
    ])
  end

  it "renders a list of positions" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Special Requirement".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Files".to_s, :count => 2
  end
end
