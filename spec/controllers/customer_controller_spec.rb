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

  describe 'GET #show' do
    it "assigns the requested customer to @customer" do
      customer = create(:customer)
      get :show, params: { id: customer }
      expect(assigns(:customer)).to eq customer
    end

    it "renders the :show template" do
      customer = create(:customer)
      get :show, params: { id: customer }
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "assigns a new Customer to @customer" do
      get :new
      expect(assigns(:customer)).to be_a_new(Customer)
    end

    it "renders the :new template" do
      get :new
      expect(:response).to render_template :new
    end
  end

end