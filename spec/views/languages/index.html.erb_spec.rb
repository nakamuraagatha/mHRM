require 'rails_helper'

RSpec.describe "languages/index", type: :view do
  before(:each) do
    assign(:languages, [
      Language.create!(
        :language_type_id => 2,
        :proficiency_id => 3,
        :note => "MyText"
      ),
      Language.create!(
        :language_type_id => 2,
        :proficiency_id => 3,
        :note => "MyText"
      )
    ])
  end

  it "renders a list of languages" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
