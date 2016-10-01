require 'rails_helper'

RSpec.describe "cases/index", type: :view do
  before(:each) do
    assign(:cases, [
      Case.create!(
        :title => "Title",
        :priority_id => 2,
        :case_type_id => 3,
        :assigned_to_id => 4
      ),
      Case.create!(
        :title => "Title",
        :priority_id => 2,
        :case_type_id => 3,
        :assigned_to_id => 4
      )
    ])
  end

  it "renders a list of cases" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
