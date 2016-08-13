require 'rails_helper'

RSpec.describe "educations/index", type: :view do
  before(:each) do
    assign(:educations, [
      Education.create!(
        :education_type => "Education Type",
        :certification => "Certification",
        :other_skill => "Other Skill",
        :note => "MyText",
        :clearence => 2
      ),
      Education.create!(
        :education_type => "Education Type",
        :certification => "Certification",
        :other_skill => "Other Skill",
        :note => "MyText",
        :clearence => 2
      )
    ])
  end

  it "renders a list of educations" do
    render
    assert_select "tr>td", :text => "Education Type".to_s, :count => 2
    assert_select "tr>td", :text => "Certification".to_s, :count => 2
    assert_select "tr>td", :text => "Other Skill".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
