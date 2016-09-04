require 'rails_helper'

RSpec.describe "other_skills/index", type: :view do
  before(:each) do
    assign(:other_skills, [
      OtherSkill.create!(
        :user_id => 2,
        :name => "Name",
        :note => "MyText",
        :file => "File"
      ),
      OtherSkill.create!(
        :user_id => 2,
        :name => "Name",
        :note => "MyText",
        :file => "File"
      )
    ])
  end

  it "renders a list of other_skills" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "File".to_s, :count => 2
  end
end
