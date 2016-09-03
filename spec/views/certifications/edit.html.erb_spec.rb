require 'rails_helper'

RSpec.describe "certifications/edit", type: :view do
  before(:each) do
    @certification = assign(:certification, Certification.create!(
      :certification_type_id => 1,
      :user_id => 1,
      :note => "MyText"
    ))
  end

  it "renders the edit certification form" do
    render

    assert_select "form[action=?][method=?]", certification_path(@certification), "post" do

      assert_select "input#certification_certification_type_id[name=?]", "certification[certification_type_id]"

      assert_select "input#certification_user_id[name=?]", "certification[user_id]"

      assert_select "textarea#certification_note[name=?]", "certification[note]"
    end
  end
end
