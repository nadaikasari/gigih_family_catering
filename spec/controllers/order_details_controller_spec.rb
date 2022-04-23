require 'rails_helper'

describe OrderDetailsController do

    before :each do
        Menu.create(name: "Nasi", description: "Nasi putih", price: 2000, category: "[\'Beverage\', \'Drink\']")
        Category.create(name: "Makanan Utama")
        Customer.create(name: "Nadiya", email: "nadiya@gmail.com")
        Order.create(customer_id: 1, order_date: "2022/04/14", status: "NEW")
    end

    describe 'GET #index' do
      context 'without params[:id]' do
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
      
      context 'with params[:id]' do
        it "populates an array of all Order Details" do 
            order1 = create(:order_detail, order_id: 1, menu_id: 1, price: 10000, quantity: 2)
            order2 = create(:order_detail, order_id: 1, menu_id: 1, price: 30000, quantity: 2)
            get :index, params: { id: 1 }
            expect(assigns(:order_details)).to match_array([order1, order2])
        end
  
        it "renders the :index template" do
          get :index, params: { id: 1 }
          expect(response).to render_template :index
        end
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

    describe 'GET #edit' do
        it "assigns the requested Order detail to @order_detail" do
            order_detail = create(:order_detail)
            get :edit, params: { id: order_detail }
            expect(assigns(:order_detail)).to eq order_detail
        end

        it "renders the :edit template" do
            order_detail = create(:order_detail)
            get :edit, params: { id: order_detail }
            expect(response).to render_template :edit
        end
    end

    describe 'POST #create' do  
        context "with valid attributes" do
            it "saves the new order detail in the database" do
                expect{
                post :create, params: { order_detail: attributes_for(:order_detail) }
                }.to change(OrderDetail, :count).by(1)
            end

            it "redirects to order_detail#show" do
                post :create, params: { order_detail: attributes_for(:order_detail) }
                expect(response).to redirect_to(order_detail_path(assigns[:order_detail]))
            end
            
            it "does not save the new order_detail in the database" do
                expect{
                post :create, params: { order_detail: attributes_for(:invalid_order_detail) }
                }.not_to change(OrderDetail, :count)
            end

            it "re-renders the :new template" do
                post :create, params: { order_detail: attributes_for(:invalid_order_detail) }
                expect(response).to render_template :new
            end
        end
    end

    describe 'PATCH #update' do
        before :each do
            @order_detail = create(:order_detail)
        end

        context "with valid attributes" do
            it "locates the requested @order_detail" do
                patch :update, params: { id: @order_detail, order_detail: attributes_for(:order_detail) }
                expect(assigns(:order_detail)).to eq @order_detail
            end

            it "changes @order_detail's attributes" do
                patch :update, params: { id: @order_detail, order_detail: attributes_for(:order_detail, menu_id: 1) }
                @order_detail.reload
                expect(@order_detail.menu_id).to eq(1)
            end

            it "redirects to the order_detail" do
                patch :update, params: { id: @order_detail, order_detail: attributes_for(:order_detail) }
                expect(response).to redirect_to @order_detail
            end
        end
    end

    describe 'PATCH #update' do
        before :each do
            @order_detail = create(:order_detail)
        end

        context 'with invalid attributes' do
            it 'does not save the updated order_detail in the database' do
                patch :update, params: { id: @order_detail, order_detail: attributes_for(:invalid_order_detail, menu_id: "Update") }
                expect(@order_detail.menu_id).not_to eq("Update")
            end

            it 're-renders the edit template' do
                patch :update, params: { id: @order_detail, order_detail: attributes_for(:invalid_order_detail) }
                expect(assigns(:order_detail)).to eq @order_detail
                expect(response).to have_http_status(:unprocessable_entity)
            end
        end
    end

    describe 'DELETE #destroy' do
        before :each do
            @order_detail = create(:order_detail)
        end

        it "deletes the order_detail from the database" do
            expect{
                delete :destroy, params: { id: @order_detail }
            }.to change(OrderDetail, :count).by(-1)
        end

        it "redirects to order_detail#index" do
            delete :destroy, params: { id: @order_detail }
            expect(response).to redirect_to order_details_url
        end
    end
end