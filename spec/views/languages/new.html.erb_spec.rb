require 'rails_helper'

RSpec.describe "languages/new", type: :view do
  before(:each) do
    assign(:language, Language.new(
      :language_type_id => 1,
      :proficiency_id => 1,
      :note => "MyText"
    ))
  end

  it "renders new language form" do
    render

    assert_select "form[action=?][method=?]", languages_path, "post" do

      assert_select "input#language_language_type_id[name=?]", "language[language_type_id]"

      assert_select "input#language_proficiency_id[name=?]", "language[proficiency_id]"

      assert_select "textarea#language_note[name=?]", "language[note]"
    end
  end
end
