require 'rails_helper'

RSpec.describe "contact_types/show", type: :view do
  before(:each) do
    @contact_type = assign(:contact_type, ContactType.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
