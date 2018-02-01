FactoryBot.define do
  factory :profile do
    sequence(:nickname) { |n| "Nickname#{n}" }
    first_name "MyString"
    last_name "MyString"
    picture "MyString"
    user nil
  end
end
