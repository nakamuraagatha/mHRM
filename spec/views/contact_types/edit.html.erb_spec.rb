require 'rails_helper'

RSpec.describe "contact_types/edit", type: :view do
  before(:each) do
    @contact_type = assign(:contact_type, ContactType.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit contact_type form" do
    render

    assert_select "form[action=?][method=?]", contact_type_path(@contact_type), "post" do

      assert_select "input#contact_type_name[name=?]", "contact_type[name]"
    end
  end
end
