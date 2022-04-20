require 'rails_helper'

describe OrdersController do
    describe 'GET #index' do
        it "populates an array of all Orders" do 
            Customer.create(name: "Nadiya", email: "nadiya@gmail.com")
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
end