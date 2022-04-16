require 'rails_helper'

describe CategoriesController do
  describe 'GET #index' do
    context 'with params[:letter]' do
      it "populates an array of categories starting with the letter" do
        dessert = create(:category, name: "Dessert")
        beverage = create(:category, name: "Beverage")
        get :index, params: { letter: 'D' }
        expect(assigns(:categories)).to match_array([dessert])
      end

      it "renders the :index template" do
        get :index, params: { letter: 'D' }
        expect(response).to render_template :index
      end
    end

    context 'without params[:letter]' do
      it "populates an array of all categories" do 
        dessert = create(:category, name: "Dessert")
        beverage = create(:category, name: "Beverage")
        get :index
        expect(assigns(:categories)).to match_array([dessert, beverage])
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end
  end
  
  describe 'GET #show' do
    it "assigns the requested category to @category" do
      category = create(:category)
      get :show, params: { id: category }
      expect(assigns(:category)).to eq category
    end

    it "renders the :show template" do
      category = create(:category)
      get :show, params: { id: category }
      expect(response).to render_template :show
    end
  end

  describe 'GET #new', :getnew do
    it "assigns a new Category to @category" do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end

    it "renders the :new template" do
      get :new
      expect(:response).to render_template :new
    end
  end
end