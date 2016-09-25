require 'rails_helper'

RSpec.describe "surveys/edit", type: :view do
  before(:each) do
    @survey = assign(:survey, Survey.create!(
      :survey_type_id => 1,
      :question => "MyText",
      :user_id => 1,
      :addigned_to_id => 1
    ))
  end

  it "renders the edit survey form" do
    render

    assert_select "form[action=?][method=?]", survey_path(@survey), "post" do

      assert_select "input#survey_survey_type_id[name=?]", "survey[survey_type_id]"

      assert_select "textarea#survey_question[name=?]", "survey[question]"

      assert_select "input#survey_user_id[name=?]", "survey[user_id]"

      assert_select "input#survey_addigned_to_id[name=?]", "survey[addigned_to_id]"
    end
  end
end
