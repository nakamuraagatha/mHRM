require 'rails_helper'

RSpec.describe "contacts/new", type: :view do
  before(:each) do
    assign(:contact, Contact.new(
      :emergency_contact => false,
      :note => "MyText"
    ))
  end

  it "renders new contact form" do
    render

    assert_select "form[action=?][method=?]", contacts_path, "post" do

      assert_select "input#contact_emergency_contact[name=?]", "contact[emergency_contact]"

      assert_select "textarea#contact_note[name=?]", "contact[note]"
    end
  end
end
