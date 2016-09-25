FactoryGirl.define do
  factory :survey do
    survey_type_id 1
    question "MyText"
    user_id 1
    addigned_to_id 1
    due_date "2016-09-25"
    date_completed "2016-09-25"
  end
end
