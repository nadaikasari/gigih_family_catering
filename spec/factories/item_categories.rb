FactoryBot.define do
  factory :item_category do
    category_id {1}
    menu_id {1}
  end

  factory :invalid_item_category, parent: :item_category do
    category_id {nil}
    menu_id {nil}
  end
end
