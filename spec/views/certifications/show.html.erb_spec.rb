require 'rails_helper'

RSpec.describe "certifications/show", type: :view do
  before(:each) do
    @certification = assign(:certification, Certification.create!(
      :certification_type_id => 2,
      :user_id => 3,
      :note => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/MyText/)
  end
end
