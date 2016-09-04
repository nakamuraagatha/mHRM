require 'rails_helper'

RSpec.describe "other_skills/new", type: :view do
  before(:each) do
    assign(:other_skill, OtherSkill.new(
      :user_id => 1,
      :name => "MyString",
      :note => "MyText",
      :file => "MyString"
    ))
  end

  it "renders new other_skill form" do
    render

    assert_select "form[action=?][method=?]", other_skills_path, "post" do

      assert_select "input#other_skill_user_id[name=?]", "other_skill[user_id]"

      assert_select "input#other_skill_name[name=?]", "other_skill[name]"

      assert_select "textarea#other_skill_note[name=?]", "other_skill[note]"

      assert_select "input#other_skill_file[name=?]", "other_skill[file]"
    end
  end
end
