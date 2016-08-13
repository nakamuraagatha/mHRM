require 'rails_helper'

RSpec.describe "educations/show", type: :view do
  before(:each) do
    @education = assign(:education, Education.create!(
      :education_type => "Education Type",
      :certification => "Certification",
      :other_skill => "Other Skill",
      :note => "MyText",
      :clearence => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Education Type/)
    expect(rendered).to match(/Certification/)
    expect(rendered).to match(/Other Skill/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
