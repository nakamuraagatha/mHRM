FactoryGirl.define do
  factory :email do
    email_address "MyString"
    email_type nil
    extend_demography nil
    note "MyText"
  end
end
