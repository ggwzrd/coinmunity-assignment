FactoryBot.define do
  factory :post do
    content "MyText"
    user_id nil
    link "MyString"
    images "MyString"
    video "MyString"
    is_spam false
  end
end
