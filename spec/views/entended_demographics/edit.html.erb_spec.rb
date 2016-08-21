require 'rails_helper'

RSpec.describe "entended_demographics/edit", type: :view do
  before(:each) do
    @entended_demographic = assign(:entended_demographic, EntendedDemographic.create!(
      :identification_id => 1
    ))
  end

  it "renders the edit entended_demographic form" do
    render

    assert_select "form[action=?][method=?]", entended_demographic_path(@entended_demographic), "post" do

      assert_select "input#entended_demographic_identification_id[name=?]", "entended_demographic[identification_id]"
    end
  end
end
