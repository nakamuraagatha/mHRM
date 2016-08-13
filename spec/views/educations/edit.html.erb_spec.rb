require 'rails_helper'

RSpec.describe "educations/edit", type: :view do
  before(:each) do
    @education = assign(:education, Education.create!(
      :education_type => "MyString",
      :certification => "MyString",
      :other_skill => "MyString",
      :note => "MyText",
      :clearence => 1
    ))
  end

  it "renders the edit education form" do
    render

    assert_select "form[action=?][method=?]", education_path(@education), "post" do

      assert_select "input#education_education_type[name=?]", "education[education_type]"

      assert_select "input#education_certification[name=?]", "education[certification]"

      assert_select "input#education_other_skill[name=?]", "education[other_skill]"

      assert_select "textarea#education_note[name=?]", "education[note]"

      assert_select "input#education_clearence[name=?]", "education[clearence]"
    end
  end
end
