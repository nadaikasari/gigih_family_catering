FactoryBot.define do
  factory :menu do
    name { Faker::Food.dish }
    description { "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to." }
    price { 10000 }
  end

  factory :invalid_menu, parent: :menu do
    name { nil }
    description { "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to it why because i dunno." }
    price { 0.0008 }
  end
end
