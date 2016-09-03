FactoryGirl.define do
  factory :certification do
    certification_type_id 1
    user_id 1
    date_received "2016-09-03"
    note "MyText"
    date_expired "2016-09-03"
  end
end
