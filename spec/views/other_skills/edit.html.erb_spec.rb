require 'rails_helper'

RSpec.describe "other_skills/edit", type: :view do
  before(:each) do
    @other_skill = assign(:other_skill, OtherSkill.create!(
      :user_id => 1,
      :name => "MyString",
      :note => "MyText",
      :file => "MyString"
    ))
  end

  it "renders the edit other_skill form" do
    render

    assert_select "form[action=?][method=?]", other_skill_path(@other_skill), "post" do

      assert_select "input#other_skill_user_id[name=?]", "other_skill[user_id]"

      assert_select "input#other_skill_name[name=?]", "other_skill[name]"

      assert_select "textarea#other_skill_note[name=?]", "other_skill[note]"

      assert_select "input#other_skill_file[name=?]", "other_skill[file]"
    end
  end
end
