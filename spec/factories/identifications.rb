FactoryGirl.define do
  factory :identification do
    identification_number "MyString"
    status false
    date_expired "2016-08-21"
    issued_by "MyString"
    note "MyText"
    identification_type_id 1
  end
end
