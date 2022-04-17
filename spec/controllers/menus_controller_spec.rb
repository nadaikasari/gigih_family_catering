require 'rails_helper'

describe MenusController do
    describe 'GET #index' do
    context 'with params[:letter]' do
      it "populates an array of menus starting with the letter" do
        nasi = create(:menu, name: "Nasi")
        ayam = create(:menu, name: "Ayam")
        get :index, params: { letter: 'N' }
        expect(assigns(:menus)).to match_array([nasi])
      end

      it "renders the :index template" do
        get :index, params: { letter: 'N' }
        expect(response).to render_template :index
      end
    end

    context 'without params[:letter]' do
      it "populates an array of all menus" do 
        nasi = create(:menu, name: "Nasi")
        ayam = create(:menu, name: "Ayam")
        get :index
        expect(assigns(:menus)).to match_array([nasi, ayam])
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe 'GET #show', :show do
    it "assigns the requested menu to @menu" do
      menu = create(:menu)
      get :show, params: { id: menu }
      expect(assigns(:menu)).to eq menu
    end

    it "renders the :show template" do
      menu = create(:menu)
      get :show, params: { id: menu }
      expect(response).to render_template :show
    end
  end

end