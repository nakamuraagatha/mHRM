require 'rails_helper'

RSpec.describe "educations/new", type: :view do
  before(:each) do
    assign(:education, Education.new(
      :education_type => "MyString",
      :certification => "MyString",
      :other_skill => "MyString",
      :note => "MyText",
      :clearence => 1
    ))
  end

  it "renders new education form" do
    render

    assert_select "form[action=?][method=?]", educations_path, "post" do

      assert_select "input#education_education_type[name=?]", "education[education_type]"

      assert_select "input#education_certification[name=?]", "education[certification]"

      assert_select "input#education_other_skill[name=?]", "education[other_skill]"

      assert_select "textarea#education_note[name=?]", "education[note]"

      assert_select "input#education_clearence[name=?]", "education[clearence]"
    end
  end
end
