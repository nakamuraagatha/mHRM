require 'rails_helper'

RSpec.describe "contacts/index", type: :view do
  before(:each) do
    assign(:contacts, [
      Contact.create!(
        :emergency_contact => false,
        :note => "MyText"
      ),
      Contact.create!(
        :emergency_contact => false,
        :note => "MyText"
      )
    ])
  end

  it "renders a list of contacts" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
