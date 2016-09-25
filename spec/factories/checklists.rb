FactoryGirl.define do
  factory :checklist do
    status false
    description "MyString"
    due_date "2016-09-24"
    user_id 1
  end
end
