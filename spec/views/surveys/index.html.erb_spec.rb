require 'rails_helper'

RSpec.describe "surveys/index", type: :view do
  before(:each) do
    assign(:surveys, [
      Survey.create!(
        :survey_type_id => 2,
        :question => "MyText",
        :user_id => 3,
        :addigned_to_id => 4
      ),
      Survey.create!(
        :survey_type_id => 2,
        :question => "MyText",
        :user_id => 3,
        :addigned_to_id => 4
      )
    ])
  end

  it "renders a list of surveys" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
