require 'rails_helper'

RSpec.describe "documents/index", type: :view do
  before(:each) do
    assign(:documents, [
      Document.create!(
        :title => "Title",
        :description => "MyText",
        :user_id => 2,
        :document_type_id => 3,
        :attachment => "Attachment"
      ),
      Document.create!(
        :title => "Title",
        :description => "MyText",
        :user_id => 2,
        :document_type_id => 3,
        :attachment => "Attachment"
      )
    ])
  end

  it "renders a list of documents" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Attachment".to_s, :count => 2
  end
end
