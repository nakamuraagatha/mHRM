require 'rails_helper'

RSpec.describe "organizations/new", type: :view do
  before(:each) do
    assign(:organization, Organization.new(
      :name => "MyString",
      :address_id => 1,
      :note => "MyText",
      :contact_id => 1
    ))
  end

  it "renders new organization form" do
    render

    assert_select "form[action=?][method=?]", organizations_path, "post" do

      assert_select "input#organization_name[name=?]", "organization[name]"

      assert_select "input#organization_address_id[name=?]", "organization[address_id]"

      assert_select "textarea#organization_note[name=?]", "organization[note]"

      assert_select "input#organization_contact_id[name=?]", "organization[contact_id]"
    end
  end
end
