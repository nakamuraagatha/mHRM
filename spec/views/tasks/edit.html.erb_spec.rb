require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :title => "MyString",
      :description => "MyText",
      :task_type_id => 1,
      :priority_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do

      assert_select "input#task_title[name=?]", "task[title]"

      assert_select "textarea#task_description[name=?]", "task[description]"

      assert_select "input#task_task_type_id[name=?]", "task[task_type_id]"

      assert_select "input#task_priority_id[name=?]", "task[priority_id]"

      assert_select "input#task_user_id[name=?]", "task[user_id]"
    end
  end
end
