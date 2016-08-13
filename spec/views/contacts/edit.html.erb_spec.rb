require 'rails_helper'

RSpec.describe "contacts/edit", type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      :emergency_contact => false,
      :note => "MyText"
    ))
  end

  it "renders the edit contact form" do
    render

    assert_select "form[action=?][method=?]", contact_path(@contact), "post" do

      assert_select "input#contact_emergency_contact[name=?]", "contact[emergency_contact]"

      assert_select "textarea#contact_note[name=?]", "contact[note]"
    end
  end
end
