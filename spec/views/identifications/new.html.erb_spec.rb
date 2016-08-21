require 'rails_helper'

RSpec.describe "identifications/new", type: :view do
  before(:each) do
    assign(:identification, Identification.new(
      :identification_number => "MyString",
      :status => false,
      :issued_by => "MyString",
      :note => "MyText",
      :identification_type_id => 1
    ))
  end

  it "renders new identification form" do
    render

    assert_select "form[action=?][method=?]", identifications_path, "post" do

      assert_select "input#identification_identification_number[name=?]", "identification[identification_number]"

      assert_select "input#identification_status[name=?]", "identification[status]"

      assert_select "input#identification_issued_by[name=?]", "identification[issued_by]"

      assert_select "textarea#identification_note[name=?]", "identification[note]"

      assert_select "input#identification_identification_type_id[name=?]", "identification[identification_type_id]"
    end
  end
end
