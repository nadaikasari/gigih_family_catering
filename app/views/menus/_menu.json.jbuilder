json.extract! menu, :id, :created_at, :name, :price, :description, :category, :updated_at
json.url menu_url(menu, format: :json)
