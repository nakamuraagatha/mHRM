require 'rails_helper'

RSpec.describe "clearances/index", type: :view do
  before(:each) do
    assign(:clearances, [
      Clearance.create!(
        :clearence_type_id => 2,
        :user_id => 3,
        :note => "MyText"
      ),
      Clearance.create!(
        :clearence_type_id => 2,
        :user_id => 3,
        :note => "MyText"
      )
    ])
  end

  it "renders a list of clearances" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
