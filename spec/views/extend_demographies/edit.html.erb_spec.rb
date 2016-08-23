require 'rails_helper'

RSpec.describe "extend_demographies/edit", type: :view do
  before(:each) do
    @extend_demography = assign(:extend_demography, ExtendDemography.create!(
      :user => nil,
      :identification => nil
    ))
  end

  it "renders the edit extend_demography form" do
    render

    assert_select "form[action=?][method=?]", extend_demography_path(@extend_demography), "post" do

      assert_select "input#extend_demography_user_id[name=?]", "extend_demography[user_id]"

      assert_select "input#extend_demography_identification_id[name=?]", "extend_demography[identification_id]"
    end
  end
end
