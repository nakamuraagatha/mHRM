require 'rails_helper'

RSpec.describe "clearances/new", type: :view do
  before(:each) do
    assign(:clearance, Clearance.new(
      :clearence_type_id => 1,
      :user_id => 1,
      :note => "MyText"
    ))
  end

  it "renders new clearance form" do
    render

    assert_select "form[action=?][method=?]", clearances_path, "post" do

      assert_select "input#clearance_clearence_type_id[name=?]", "clearance[clearence_type_id]"

      assert_select "input#clearance_user_id[name=?]", "clearance[user_id]"

      assert_select "textarea#clearance_note[name=?]", "clearance[note]"
    end
  end
end
