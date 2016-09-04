require 'rails_helper'

RSpec.describe "other_skills/show", type: :view do
  before(:each) do
    @other_skill = assign(:other_skill, OtherSkill.create!(
      :user_id => 2,
      :name => "Name",
      :note => "MyText",
      :file => "File"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/File/)
  end
end
