require 'rails_helper'

describe ItemCategoriesController do

    before :each do
        Menu.create(name: "Nasi Padang", description: "Nasi dengan berbagai macam lauk-pauk khas Indonesia.", price: 10000)
        Category.create(name: "Makanan Utama")
    end

    describe 'GET #index' do
        it "populates an array of all ItemCategories" do 
            item1 = create(:item_category, menu_id: 1, category_id: 1)
            item2 = create(:item_category, menu_id: 1, category_id: 1)
            get :index
            expect(assigns(:item_categories)).to match_array([item1, item2])
        end

        it "renders the :index template" do
            get :index
            expect(response).to render_template :index
        end
    end
end