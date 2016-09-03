require 'rails_helper'

RSpec.describe "certifications/index", type: :view do
  before(:each) do
    assign(:certifications, [
      Certification.create!(
        :certification_type_id => 2,
        :user_id => 3,
        :note => "MyText"
      ),
      Certification.create!(
        :certification_type_id => 2,
        :user_id => 3,
        :note => "MyText"
      )
    ])
  end

  it "renders a list of certifications" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
