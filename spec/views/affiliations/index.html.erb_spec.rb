require 'rails_helper'

RSpec.describe "affiliations/index", type: :view do
  before(:each) do
    assign(:affiliations, [
      Affiliation.create!(
        :user_id => 2,
        :name => "Name",
        :affiliation_type => 3,
        :note => "MyText"
      ),
      Affiliation.create!(
        :user_id => 2,
        :name => "Name",
        :affiliation_type => 3,
        :note => "MyText"
      )
    ])
  end

  it "renders a list of affiliations" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
