require 'rails_helper'

RSpec.describe "languages/show", type: :view do
  before(:each) do
    @language = assign(:language, Language.create!(
      :language_type_id => 2,
      :proficiency_id => 3,
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
