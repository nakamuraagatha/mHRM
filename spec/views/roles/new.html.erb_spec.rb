require 'rails_helper'

RSpec.describe "roles/new", type: :view do
  before(:each) do
    assign(:role, Role.new(
      :name => "MyString",
      :state => false,
      :note => "MyText"
    ))
  end

  it "renders new role form" do
    render

    assert_select "form[action=?][method=?]", roles_path, "post" do

      assert_select "input#role_name[name=?]", "role[name]"

      assert_select "input#role_state[name=?]", "role[state]"

      assert_select "textarea#role_note[name=?]", "role[note]"
    end
  end
end
