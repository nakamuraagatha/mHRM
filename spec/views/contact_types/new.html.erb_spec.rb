require 'rails_helper'

RSpec.describe "contact_types/new", type: :view do
  before(:each) do
    assign(:contact_type, ContactType.new(
      :name => "MyString"
    ))
  end

  it "renders new contact_type form" do
    render

    assert_select "form[action=?][method=?]", contact_types_path, "post" do

      assert_select "input#contact_type_name[name=?]", "contact_type[name]"
    end
  end
end
