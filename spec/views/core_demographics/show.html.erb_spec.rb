require 'rails_helper'

RSpec.describe "core_demographics/show", type: :view do
  before(:each) do
    @core_demographic = assign(:core_demographic, CoreDemographic.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :middle_name => "Middle Name",
      :gender_id => 2,
      :religion_id => 3,
      :title => "Title",
      :note => "MyText",
      :ethnicity_id => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Middle Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/4/)
  end
end
