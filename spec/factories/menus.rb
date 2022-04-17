FactoryBot.define do
  factory :menu do
    name { Faker::Food.dish }
    description { "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to." }
    price { 10000 }
  end
end
