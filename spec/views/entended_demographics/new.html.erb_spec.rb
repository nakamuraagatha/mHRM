require 'rails_helper'

RSpec.describe "entended_demographics/new", type: :view do
  before(:each) do
    assign(:entended_demographic, EntendedDemographic.new(
      :identification_id => 1
    ))
  end

  it "renders new entended_demographic form" do
    render

    assert_select "form[action=?][method=?]", entended_demographics_path, "post" do

      assert_select "input#entended_demographic_identification_id[name=?]", "entended_demographic[identification_id]"
    end
  end
end
