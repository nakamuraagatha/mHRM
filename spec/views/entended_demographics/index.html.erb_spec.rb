require 'rails_helper'

RSpec.describe "entended_demographics/index", type: :view do
  before(:each) do
    assign(:entended_demographics, [
      EntendedDemographic.create!(
        :identification_id => 2
      ),
      EntendedDemographic.create!(
        :identification_id => 2
      )
    ])
  end

  it "renders a list of entended_demographics" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
