require 'rails_helper'

describe ItemCategoryController do
  describe 'GET #index', :index do
    context 'with params[:id]' do
      it "populates an array of item category starting with the menu id" do
        menu_id1 = create(:item_category, menu_id: 13, category_id: 1)
        menu_id2 = create(:item_category, menu_id: 11, category_id: 2)
        get :index, params: { id: 13 }
        expect(assigns(:item_categories)).to match_array([menu_id1])
      end

      it "renders the :index template" do
        get :index, params: { id: 13 }
        expect(response).to render_template :index
      end
    end

    context 'without params[:id]' do
      it "populates an array of all item categories" do 
        @menu = create(:menu)
        @category = create(:category)
        
        menu_id1 = create(:item_category)
        menu_id2 = create(:item_category)
        
        get :index
        
        expect(assigns(:item_categories)).to match_array([menu_id1, menu_id2])
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe 'GET #show', :show do
    it "assigns the requested item category to @item_category" do
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


  
end