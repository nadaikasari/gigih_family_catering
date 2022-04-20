FactoryBot.define do
  factory :order_detail do
    order_id { 1 }
    menu_id { 1 }
    price { 20000 }
    quantity { 2 }
  end

  factory :invalid_order_detail, parent: :order_detail do
    order_id { nil }
    menu_id { nil }
    price { "seribu" }
    quantity { nil }
  end
end
