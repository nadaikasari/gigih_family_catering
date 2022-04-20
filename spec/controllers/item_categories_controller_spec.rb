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

    describe 'GET #show' do
        it "assigns the requested item_category to @item_category" do
            item_category = create(:item_category)
            get :show, params: { id: item_category }
            expect(assigns(:item_category)).to eq item_category
        end

        it "renders the :show template" do
            item_category = create(:item_category)
            get :show, params: { id: item_category }
            expect(response).to render_template :show
        end
    end

    describe 'GET #new' do
        it "assigns a new ItemCategory to @item_category" do
            get :new
            expect(assigns(:item_category)).to be_a_new(ItemCategory)
        end

        it "renders the :new template" do
            get :new
            expect(:response).to render_template :new
        end
    end

    describe 'GET #edit' do
        it "assigns the requested item category to @item_category" do
            item_category = create(:item_category)
            get :edit, params: { id: item_category }
            expect(assigns(:item_category)).to eq item_category
        end

        it "renders the :edit template" do
            item_category = create(:item_category)
            get :edit, params: { id: item_category }
            expect(response).to render_template :edit
        end
    end


end