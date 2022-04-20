require 'rails_helper'

describe OrderDetailsController do

    before :each do
        Menu.create(name: "Nasi Padang", description: "Nasi dengan berbagai macam lauk-pauk khas Indonesia.", price: 10000)
        Category.create(name: "Makanan Utama")
        Customer.create(name: "Nadiya", email: "nadiya@gmail.com")
        Order.create(customer_id: 1, order_date: "2022/04/14", status: "NEW")
    end

    describe 'GET #index' do
        it "populates an array of all Order Details" do 
            order1 = create(:order_detail, order_id: 1, menu_id: 1, price: 10000, quantity: 2)
            order2 = create(:order_detail, order_id: 1, menu_id: 1, price: 10000, quantity: 2)
            get :index
            expect(assigns(:order_details)).to match_array([order1, order2])
        end

        it "renders the :index template" do
            get :index
            expect(response).to render_template :index
        end
    end
    
    describe 'GET #show' do
        it "assigns the requested order_detail to @order_detail" do
            order_detail = create(:order_detail)
            get :show, params: { id: order_detail }
            expect(assigns(:order_detail)).to eq order_detail
        end

        it "renders the :show template" do
            order_detail = create(:order_detail)
            get :show, params: { id: order_detail }
            expect(response).to render_template :show
        end
    end

    describe 'GET #new' do
        it "assigns a new Order detail to @order_detail" do
            get :new
            expect(assigns(:order_detail)).to be_a_new(OrderDetail)
        end

        it "renders the :new template" do
            get :new
            expect(:response).to render_template :new
        end
    end
end