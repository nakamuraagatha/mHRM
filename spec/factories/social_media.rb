FactoryGirl.define do
  factory :social_medium do
    social_media_type_id 1
    note "MyText"
    social_media_handle "MyString"
    extend_demography nil
  end
end
