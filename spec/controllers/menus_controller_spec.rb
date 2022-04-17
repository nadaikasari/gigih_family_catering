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


end