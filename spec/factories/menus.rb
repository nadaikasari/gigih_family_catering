FactoryBot.define do
  factory :menu do
    name { "Ayam" }
    description { "Ayam yang digoreng" }
    price { 2000 }
    category { ["Beverage"] }
  end

  factory :invalid_menu, parent: :menu do
    name { nil }
    description { nil }
    price { nil }
    category { nil }
  end
end
