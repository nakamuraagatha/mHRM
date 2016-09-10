require 'rails_helper'

RSpec.describe "affiliations/show", type: :view do
  before(:each) do
    @affiliation = assign(:affiliation, Affiliation.create!(
      :user_id => 2,
      :name => "Name",
      :affiliation_type => 3,
      :note => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/MyText/)
  end
end
