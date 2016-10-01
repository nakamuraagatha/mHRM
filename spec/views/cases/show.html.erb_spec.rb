require 'rails_helper'

RSpec.describe "cases/show", type: :view do
  before(:each) do
    @case = assign(:case, Case.create!(
      :title => "Title",
      :priority_id => 2,
      :case_type_id => 3,
      :assigned_to_id => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
