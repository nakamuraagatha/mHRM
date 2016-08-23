FactoryGirl.define do
  factory :phone do
    phone_number "MyString"
    phone_type nil
    extend_demography nil
    note "MyText"
  end
end
