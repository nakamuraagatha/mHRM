require 'rails_helper'

RSpec.describe "extend_demographies/index", type: :view do
  before(:each) do
    assign(:extend_demographies, [
      ExtendDemography.create!(
        :user => nil,
        :identification => nil
      ),
      ExtendDemography.create!(
        :user => nil,
        :identification => nil
      )
    ])
  end

  it "renders a list of extend_demographies" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
