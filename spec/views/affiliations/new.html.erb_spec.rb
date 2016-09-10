require 'rails_helper'

RSpec.describe "affiliations/new", type: :view do
  before(:each) do
    assign(:affiliation, Affiliation.new(
      :user_id => 1,
      :name => "MyString",
      :affiliation_type => 1,
      :note => "MyText"
    ))
  end

  it "renders new affiliation form" do
    render

    assert_select "form[action=?][method=?]", affiliations_path, "post" do

      assert_select "input#affiliation_user_id[name=?]", "affiliation[user_id]"

      assert_select "input#affiliation_name[name=?]", "affiliation[name]"

      assert_select "input#affiliation_affiliation_type[name=?]", "affiliation[affiliation_type]"

      assert_select "textarea#affiliation_note[name=?]", "affiliation[note]"
    end
  end
end
