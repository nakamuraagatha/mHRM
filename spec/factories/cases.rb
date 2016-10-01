FactoryGirl.define do
  factory :case do
    title "MyString"
    priority_id 1
    case_type_id 1
    date_start "2016-10-01"
    date_due "2016-10-01"
    date_complete "2016-10-01"
    assigned_to_id 1
  end
end
