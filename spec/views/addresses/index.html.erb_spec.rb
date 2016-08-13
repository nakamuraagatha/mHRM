require 'rails_helper'

RSpec.describe "addresses/index", type: :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        :address_type => 2,
        :address => "Address",
        :city => "City",
        :zip_code => "Zip Code",
        :state => "State",
        :country_code => "Country Code"
      ),
      Address.create!(
        :address_type => 2,
        :address => "Address",
        :city => "City",
        :zip_code => "Zip Code",
        :state => "State",
        :country_code => "Country Code"
      )
    ])
  end

  it "renders a list of addresses" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Zip Code".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country Code".to_s, :count => 2
  end
end
