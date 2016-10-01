require 'rails_helper'

RSpec.describe "cases/new", type: :view do
  before(:each) do
    assign(:case, Case.new(
      :title => "MyString",
      :priority_id => 1,
      :case_type_id => 1,
      :assigned_to_id => 1
    ))
  end

  it "renders new case form" do
    render

    assert_select "form[action=?][method=?]", cases_path, "post" do

      assert_select "input#case_title[name=?]", "case[title]"

      assert_select "input#case_priority_id[name=?]", "case[priority_id]"

      assert_select "input#case_case_type_id[name=?]", "case[case_type_id]"

      assert_select "input#case_assigned_to_id[name=?]", "case[assigned_to_id]"
    end
  end
end
