require 'rails_helper'

RSpec.describe "addresses/edit", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :address_type => 1,
      :address => "MyString",
      :city => "MyString",
      :zip_code => "MyString",
      :state => "MyString",
      :country_code => "MyString"
    ))
  end

  it "renders the edit address form" do
    render

    assert_select "form[action=?][method=?]", address_path(@address), "post" do

      assert_select "input#address_address_type[name=?]", "address[address_type]"

      assert_select "input#address_address[name=?]", "address[address]"

      assert_select "input#address_city[name=?]", "address[city]"

      assert_select "input#address_zip_code[name=?]", "address[zip_code]"

      assert_select "input#address_state[name=?]", "address[state]"

      assert_select "input#address_country_code[name=?]", "address[country_code]"
    end
  end
end
