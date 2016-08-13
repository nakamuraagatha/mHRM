require 'rails_helper'

RSpec.describe "contact_types/index", type: :view do
  before(:each) do
    assign(:contact_types, [
      ContactType.create!(
        :name => "Name"
      ),
      ContactType.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of contact_types" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
