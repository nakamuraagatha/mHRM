require 'rails_helper'

RSpec.describe "cases/edit", type: :view do
  before(:each) do
    @case = assign(:case, Case.create!(
      :title => "MyString",
      :priority_id => 1,
      :case_type_id => 1,
      :assigned_to_id => 1
    ))
  end

  it "renders the edit case form" do
    render

    assert_select "form[action=?][method=?]", case_path(@case), "post" do

      assert_select "input#case_title[name=?]", "case[title]"

      assert_select "input#case_priority_id[name=?]", "case[priority_id]"

      assert_select "input#case_case_type_id[name=?]", "case[case_type_id]"

      assert_select "input#case_assigned_to_id[name=?]", "case[assigned_to_id]"
    end
  end
end
