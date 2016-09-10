require 'rails_helper'

RSpec.describe "languages/edit", type: :view do
  before(:each) do
    @language = assign(:language, Language.create!(
      :language_type_id => 1,
      :proficiency_id => 1,
      :note => "MyText"
    ))
  end

  it "renders the edit language form" do
    render

    assert_select "form[action=?][method=?]", language_path(@language), "post" do

      assert_select "input#language_language_type_id[name=?]", "language[language_type_id]"

      assert_select "input#language_proficiency_id[name=?]", "language[proficiency_id]"

      assert_select "textarea#language_note[name=?]", "language[note]"
    end
  end
end
