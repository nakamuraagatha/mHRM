require 'rails_helper'

RSpec.describe "departments/new", type: :view do
  before(:each) do
    assign(:department, Department.new(
      :user_id => 1,
      :note => "MyText"
    ))
  end

  it "renders new department form" do
    render

    assert_select "form[action=?][method=?]", departments_path, "post" do

      assert_select "input#department_user_id[name=?]", "department[user_id]"

      assert_select "textarea#department_note[name=?]", "department[note]"
    end
  end
end
