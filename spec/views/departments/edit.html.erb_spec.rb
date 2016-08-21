require 'rails_helper'

RSpec.describe "departments/edit", type: :view do
  before(:each) do
    @department = assign(:department, Department.create!(
      :user_id => 1,
      :note => "MyText"
    ))
  end

  it "renders the edit department form" do
    render

    assert_select "form[action=?][method=?]", department_path(@department), "post" do

      assert_select "input#department_user_id[name=?]", "department[user_id]"

      assert_select "textarea#department_note[name=?]", "department[note]"
    end
  end
end
