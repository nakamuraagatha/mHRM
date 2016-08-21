require 'rails_helper'

RSpec.describe "identifications/index", type: :view do
  before(:each) do
    assign(:identifications, [
      Identification.create!(
        :identification_number => "Identification Number",
        :status => false,
        :issued_by => "Issued By",
        :note => "MyText",
        :identification_type_id => 2
      ),
      Identification.create!(
        :identification_number => "Identification Number",
        :status => false,
        :issued_by => "Issued By",
        :note => "MyText",
        :identification_type_id => 2
      )
    ])
  end

  it "renders a list of identifications" do
    render
    assert_select "tr>td", :text => "Identification Number".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Issued By".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
