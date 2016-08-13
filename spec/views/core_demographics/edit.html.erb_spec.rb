require 'rails_helper'

RSpec.describe "core_demographics/edit", type: :view do
  before(:each) do
    @core_demographic = assign(:core_demographic, CoreDemographic.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :middle_name => "MyString",
      :gender_id => 1,
      :religion_id => 1,
      :title => "MyString",
      :note => "MyText",
      :ethnicity_id => 1
    ))
  end

  it "renders the edit core_demographic form" do
    render

    assert_select "form[action=?][method=?]", core_demographic_path(@core_demographic), "post" do

      assert_select "input#core_demographic_first_name[name=?]", "core_demographic[first_name]"

      assert_select "input#core_demographic_last_name[name=?]", "core_demographic[last_name]"

      assert_select "input#core_demographic_middle_name[name=?]", "core_demographic[middle_name]"

      assert_select "input#core_demographic_gender_id[name=?]", "core_demographic[gender_id]"

      assert_select "input#core_demographic_religion_id[name=?]", "core_demographic[religion_id]"

      assert_select "input#core_demographic_title[name=?]", "core_demographic[title]"

      assert_select "textarea#core_demographic_note[name=?]", "core_demographic[note]"

      assert_select "input#core_demographic_ethnicity_id[name=?]", "core_demographic[ethnicity_id]"
    end
  end
end
