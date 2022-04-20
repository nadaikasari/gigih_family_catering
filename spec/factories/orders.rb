FactoryBot.define do
  factory :order do
    customer_id { "1" }
    order_date { "2022/04/14" }
    status { "NEW" }
  end

  factory :invalid_order, parent: :order do
    customer_id { nil }
    order_date { nil }
    status { nil }
  end
end
