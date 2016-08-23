require 'rails_helper'

RSpec.describe "extend_demographies/new", type: :view do
  before(:each) do
    assign(:extend_demography, ExtendDemography.new(
      :user => nil,
      :identification => nil
    ))
  end

  it "renders new extend_demography form" do
    render

    assert_select "form[action=?][method=?]", extend_demographies_path, "post" do

      assert_select "input#extend_demography_user_id[name=?]", "extend_demography[user_id]"

      assert_select "input#extend_demography_identification_id[name=?]", "extend_demography[identification_id]"
    end
  end
end
