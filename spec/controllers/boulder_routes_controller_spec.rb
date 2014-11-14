require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe BoulderRoutesController, :type => :controller do


  before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:boulder_route)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:boulder_route, name:nil, latitude: nil, longitude: nil, zoom:nil, )
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BoulderRoutesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  # GET
  describe "GET" do

    before(:each) do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.start
      DatabaseCleaner.clean
    end

    context "index" do
      it "assigns all boulder_routes as @boulder_routes" do
        boulder_route = BoulderRoute.create! valid_attributes
        get :index, {}, valid_session
        expect(assigns(:boulder_routes)).to eq([boulder_route])
      end
    end

    describe "show" do
      it "assigns the requested boulder_route as @boulder_route" do
        boulder_route = BoulderRoute.create! valid_attributes
        get :show, {:id => boulder_route.to_param}, valid_session
        expect(assigns(:boulder_route)).to eq(boulder_route)
      end
    end

    describe "new" do
      it "assigns a new boulder_route as @boulder_route" do
        get :new, {}, valid_session
        expect(assigns(:boulder_route)).to be_a_new(BoulderRoute)
      end
    end

    describe "edit" do
      it "assigns the requested boulder_route as @boulder_route" do
        boulder_route = BoulderRoute.create! valid_attributes
        get :edit, {:id => boulder_route.to_param}, valid_session
        expect(assigns(:boulder_route)).to eq(boulder_route)
      end
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new BoulderRoute" do
        expect {
          post :create, {:boulder_route => valid_attributes}, valid_session
        }.to change(BoulderRoute, :count).by(1)
      end

      it "assigns a newly created boulder_route as @boulder_route" do
        post :create, {:boulder_route => valid_attributes}, valid_session
        expect(assigns(:boulder_route)).to be_a(BoulderRoute)
        expect(assigns(:boulder_route)).to be_persisted
      end

      it "redirects to the created boulder_route" do
        post :create, {:boulder_route => valid_attributes}, valid_session
        expect(response).to redirect_to(BoulderRoute.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved boulder_route as @boulder_route" do
        post :create, {:boulder_route => invalid_attributes}, valid_session
        expect(assigns(:boulder_route)).to be_a_new(BoulderRoute)
      end

      it "re-renders the 'new' template" do
        post :create, {:boulder_route => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:boulder_route, name:"It's Jimmy!")
      }

      it "updates the requested boulder_route" do
        boulder_route = BoulderRoute.create! valid_attributes
        put :update, {:id => boulder_route.to_param, :boulder_route => new_attributes}, valid_session
        boulder_route.reload
        expect(boulder_route.name).to eq("It's Jimmy!")
      end

      it "assigns the requested boulder_route as @boulder_route" do
        boulder_route = BoulderRoute.create! valid_attributes
        put :update, {:id => boulder_route.to_param, :boulder_route => valid_attributes}, valid_session
        expect(assigns(:boulder_route)).to eq(boulder_route)
      end

      it "redirects to the boulder_route" do
        boulder_route = BoulderRoute.create! valid_attributes
        put :update, {:id => boulder_route.to_param, :boulder_route => valid_attributes}, valid_session
        expect(response).to redirect_to(boulder_route)
      end
    end

    describe "with invalid params" do
      it "assigns the boulder_route as @boulder_route" do
        boulder_route = BoulderRoute.create! valid_attributes
        put :update, {:id => boulder_route.to_param, :boulder_route => invalid_attributes}, valid_session
        expect(assigns(:boulder_route)).to eq(boulder_route)
      end

      it "re-renders the 'edit' template" do
        boulder_route = BoulderRoute.create! valid_attributes
        put :update, {:id => boulder_route.to_param, :boulder_route => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested boulder_route" do
      boulder_route = BoulderRoute.create! valid_attributes
      expect {
        delete :destroy, {:id => boulder_route.to_param}, valid_session
      }.to change(BoulderRoute, :count).by(-1)
    end

    it "redirects to the boulder_routes list" do
      boulder_route = BoulderRoute.create! valid_attributes
      delete :destroy, {:id => boulder_route.to_param}, valid_session
      expect(response).to redirect_to(boulder_routes_url)
    end
  end

end
