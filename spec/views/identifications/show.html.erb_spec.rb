require 'rails_helper'

RSpec.describe "identifications/show", type: :view do
  before(:each) do
    @identification = assign(:identification, Identification.create!(
      :identification_number => "Identification Number",
      :status => false,
      :issued_by => "Issued By",
      :note => "MyText",
      :identification_type_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Identification Number/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Issued By/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
