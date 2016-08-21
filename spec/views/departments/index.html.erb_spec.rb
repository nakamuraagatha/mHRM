require 'rails_helper'

RSpec.describe "departments/index", type: :view do
  before(:each) do
    assign(:departments, [
      Department.create!(
        :user_id => 2,
        :note => "MyText"
      ),
      Department.create!(
        :user_id => 2,
        :note => "MyText"
      )
    ])
  end

  it "renders a list of departments" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
