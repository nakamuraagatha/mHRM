require 'rails_helper'

RSpec.describe "addresses/show", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :address_type => 2,
      :address => "Address",
      :city => "City",
      :zip_code => "Zip Code",
      :state => "State",
      :country_code => "Country Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Zip Code/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country Code/)
  end
end
