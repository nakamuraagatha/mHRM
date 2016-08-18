FactoryGirl.define do
  factory :document do
    title "MyString"
    description "MyText"
    user_id 1
    document_type_id 1
    date "2016-08-18"
    attachment "MyString"
  end
end
