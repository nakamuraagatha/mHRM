require 'rails_helper'

RSpec.describe "core_demographics/index", type: :view do
  before(:each) do
    assign(:core_demographics, [
      CoreDemographic.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :middle_name => "Middle Name",
        :gender_id => 2,
        :religion_id => 3,
        :title => "Title",
        :note => "MyText",
        :ethnicity_id => 4
      ),
      CoreDemographic.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :middle_name => "Middle Name",
        :gender_id => 2,
        :religion_id => 3,
        :title => "Title",
        :note => "MyText",
        :ethnicity_id => 4
      )
    ])
  end

  it "renders a list of core_demographics" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Middle Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
