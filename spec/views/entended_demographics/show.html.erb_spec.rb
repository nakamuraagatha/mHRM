require 'rails_helper'

RSpec.describe "entended_demographics/show", type: :view do
  before(:each) do
    @entended_demographic = assign(:entended_demographic, EntendedDemographic.create!(
      :identification_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
  end
end
