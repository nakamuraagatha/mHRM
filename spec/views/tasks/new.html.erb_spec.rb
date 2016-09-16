require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      :title => "MyString",
      :description => "MyText",
      :task_type_id => 1,
      :priority_id => 1,
      :user_id => 1
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input#task_title[name=?]", "task[title]"

      assert_select "textarea#task_description[name=?]", "task[description]"

      assert_select "input#task_task_type_id[name=?]", "task[task_type_id]"

      assert_select "input#task_priority_id[name=?]", "task[priority_id]"

      assert_select "input#task_user_id[name=?]", "task[user_id]"
    end
  end
end
