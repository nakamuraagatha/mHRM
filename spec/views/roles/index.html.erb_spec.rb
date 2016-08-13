require 'rails_helper'

RSpec.describe "roles/index", type: :view do
  before(:each) do
    assign(:roles, [
      Role.create!(
        :name => "Name",
        :state => false,
        :note => "MyText"
      ),
      Role.create!(
        :name => "Name",
        :state => false,
        :note => "MyText"
      )
    ])
  end

  it "renders a list of roles" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
