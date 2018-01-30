FactoryBot.define do
  factory :post do
    content {Faker::TheFreshPrinceOfBelAir.quote}
    user {create :user}
    link {Faker::Internet.url}
    images "https://placeimg.com/640/480/tech"
    video ""
    is_spam false
  end
end
