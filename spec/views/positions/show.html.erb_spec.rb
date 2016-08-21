require 'rails_helper'

RSpec.describe "positions/show", type: :view do
  before(:each) do
    @position = assign(:position, Position.create!(
      :user_id => 2,
      :title => "Title",
      :position_description => "MyText",
      :location => "Location",
      :special_requirement => "Special Requirement",
      :note => "MyText",
      :files => "Files"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/Special Requirement/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Files/)
  end
end
