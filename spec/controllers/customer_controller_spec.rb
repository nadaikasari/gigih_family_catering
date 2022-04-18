require 'rails_helper'

describe CustomerController do 
  
describe 'GET #index' do
    context 'with params[:letter]' do
      it "populates an array of customer starting with the letter" do
        customer1 = create(:customer, name: "Nadiya")
        customer2 = create(:customer, name: "Hidayah")
        get :index, params: { letter: 'N' }
        expect(assigns(:customers)).to match_array([customer1])
      end

      it "renders the :index template" do
        get :index, params: { letter: 'N' }
        expect(response).to render_template :index
      end
    end

    context 'without params[:letter]' do
      it "populates an array of all customers" do 
        customer1 = create(:customer, name: "Nadiya")
        customer2 = create(:customer, name: "Hidayah")
        get :index
        expect(assigns(:customers)).to match_array([customer1, customer2])
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end
  end


end