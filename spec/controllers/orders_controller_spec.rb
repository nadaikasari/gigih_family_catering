require 'rails_helper'

describe OrdersController do

    before :each do
        Customer.create(name: "Nadiya", email: "nadiya@gmail.com")
    end

    describe 'GET #index' do
        it "populates an array of all Orders" do 
            order1 = create(:order, customer_id: 1, order_date: "2022/04/14", status: "NEW")
            order2 = create(:order, customer_id: 1, order_date: "2022/04/13", status: "NEW")
            get :index
            expect(assigns(:orders)).to match_array([order1, order2])
        end

        it "renders the :index template" do
            get :index
            expect(response).to render_template :index
        end
    end

    describe 'GET #show' do
        it "assigns the requested order to @order" do
            order = create(:order)
            get :show, params: { id: order }
            expect(assigns(:order)).to eq order
        end

        it "renders the :show template" do
            order = create(:order)
            get :show, params: { id: order }
            expect(response).to render_template :show
        end
    end

    describe 'GET #new' do
        it "assigns a new Order to @order" do
            get :new
            expect(assigns(:order)).to be_a_new(Order)
        end

        it "renders the :new template" do
            get :new
            expect(:response).to render_template :new
        end
    end

    describe 'GET #edit' do
        it "assigns the requested order to @order" do
            order = create(:order)
            get :edit, params: { id: order }
            expect(assigns(:order)).to eq order
        end

        it "renders the :edit template" do
            order = create(:order)
            get :edit, params: { id: order }
            expect(response).to render_template :edit
        end
    end

    describe 'POST #create' do  
        context "with valid attributes" do
            it "saves the new order in the database" do
                expect{
                post :create, params: { order: attributes_for(:order) }
                }.to change(Order, :count).by(1)
            end

            it "redirects to order#show" do
                post :create, params: { order: attributes_for(:order) }
                expect(response).to redirect_to(order_path(assigns[:order]))
            end
            
            it "does not save the new order in the database" do
                expect{
                post :create, params: { order: attributes_for(:invalid_order) }
                }.not_to change(Order, :count)
            end

            it "re-renders the :new template" do
                post :create, params: { order: attributes_for(:invalid_order) }
                expect(response).to render_template :new
            end
        end
    end

    describe 'PATCH #update', :valid do
        before :each do
            @order = create(:order)
        end

        context "with valid attributes" do
            it "locates the requested @order" do
                patch :update, params: { id: @order, order: attributes_for(:order) }
                expect(assigns(:order)).to eq @order
            end

            it "changes @order's attributes" do
                patch :update, params: { id: @order, order: attributes_for(:order, status: 'NEW') }
                @order.reload
                expect(@order.status).to eq('NEW')
            end

            it "redirects to the order" do
                patch :update, params: { id: @order, order: attributes_for(:order) }
                expect(response).to redirect_to @order
            end
        end
    end

end