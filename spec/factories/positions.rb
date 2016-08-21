FactoryGirl.define do
  factory :position do
    user_id 1
    title "MyString"
    position_description "MyText"
    location "MyString"
    special_requirement "MyString"
    note "MyText"
    date_start "2016-08-21"
    date_end "2016-08-21"
    files "MyString"
  end
end
