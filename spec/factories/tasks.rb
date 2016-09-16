FactoryGirl.define do
  factory :task do
    title "MyString"
    description "MyText"
    task_type_id 1
    priority_id 1
    date_start "2016-09-15"
    date_due "2016-09-15"
    user_id 1
    date_completed "2016-09-15"
  end
end
