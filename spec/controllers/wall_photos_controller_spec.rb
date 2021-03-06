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

RSpec.describe WallPhotosController, :type => :controller do

  before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:wall_photo)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:wall_photo, title:nil, url:nil, wall_id: nil )
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # WallPhotosController. Be sure to keep this updated too.
  let(:valid_session) { { username: "jimmy", user_type: 'admin', user_id: 1 } }

  # GET
  describe "GET" do

    before(:each) do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.start
      DatabaseCleaner.clean
    end

    context "index" do
      it "assigns all wall_photos as @wall_photos" do
        wall_photo = WallPhoto.create! valid_attributes
        get :index, {}, valid_session
        expect(assigns(:wall_photos)).to eq([wall_photo])
      end
    end

    describe "show" do
      it "assigns the requested wall_photo as @wall_photo" do
        wall_photo = WallPhoto.create! valid_attributes
        get :show, {:id => wall_photo.to_param}, valid_session
        expect(assigns(:wall_photo)).to eq(wall_photo)
      end
    end

    describe "new" do
      it "assigns a new wall_photo as @wall_photo" do
        get :new, {}, valid_session
        expect(assigns(:wall_photo)).to be_a_new(WallPhoto)
      end
    end

    describe "edit" do
      it "assigns the requested wall_photo as @wall_photo" do
        wall_photo = WallPhoto.create! valid_attributes
        get :edit, {:id => wall_photo.to_param}, valid_session
        expect(assigns(:wall_photo)).to eq(wall_photo)
      end
    end

    describe "json" do
      it "returns a valid json object" do
        subject = FactoryGirl.create(:wall_photo)
        json = get(:getJson, {}, valid_session)
        expect(json).to_not be_nil;
      end

      it "returns a valid json object when given an id" do
        subject = FactoryGirl.create(:wall_photo) 
        json = get(:getJson, {id: subject.wall_id}, valid_session)
        expect(json).to_not be_nil;
      end
    end

  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new WallPhoto" do
        expect {
          post :create, {:wall_photo => valid_attributes}, valid_session
        }.to change(WallPhoto, :count).by(1)
      end

      it "assigns a newly created wall_photo as @wall_photo" do
        post :create, {:wall_photo => valid_attributes}, valid_session
        expect(assigns(:wall_photo)).to be_a(WallPhoto)
        expect(assigns(:wall_photo)).to be_persisted
      end

      it "redirects to the created wall_photo" do
        post :create, {:wall_photo => valid_attributes}, valid_session
        expect(response).to redirect_to(WallPhoto.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved wall_photo as @wall_photo" do
        post :create, {:wall_photo => invalid_attributes}, valid_session
        expect(assigns(:wall_photo)).to be_a_new(WallPhoto)
      end

      it "re-renders the 'new' template" do
        post :create, {:wall_photo => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:wall_photo, title:"It's Jimmy!")
      }

      it "updates the requested wall_photo" do
        wall_photo = WallPhoto.create! valid_attributes
        put :update, {:id => wall_photo.to_param, :wall_photo => new_attributes}, valid_session
        wall_photo.reload
        expect(wall_photo.title).to eq("It's Jimmy!")
      end

      it "assigns the requested wall_photo as @wall_photo" do
        wall_photo = WallPhoto.create! valid_attributes
        put :update, {:id => wall_photo.to_param, :wall_photo => valid_attributes}, valid_session
        expect(assigns(:wall_photo)).to eq(wall_photo)
      end

      it "redirects to the wall_photo" do
        wall_photo = WallPhoto.create! valid_attributes
        put :update, {:id => wall_photo.to_param, :wall_photo => valid_attributes}, valid_session
        expect(response).to redirect_to(wall_photo)
      end
    end

    describe "with invalid params" do
      it "assigns the wall_photo as @wall_photo" do
        wall_photo = WallPhoto.create! valid_attributes
        put :update, {:id => wall_photo.to_param, :wall_photo => invalid_attributes}, valid_session
        expect(assigns(:wall_photo)).to eq(wall_photo)
      end

      it "re-renders the 'edit' template" do
        wall_photo = WallPhoto.create! valid_attributes
        put :update, {:id => wall_photo.to_param, :wall_photo => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested wall_photo" do
      wall_photo = WallPhoto.create! valid_attributes
      expect {
        delete :destroy, {:id => wall_photo.to_param}, valid_session
      }.to change(WallPhoto, :count).by(-1)
    end

    it "redirects to the wall_photos list" do
      wall_photo = WallPhoto.create! valid_attributes
      delete :destroy, {:id => wall_photo.to_param}, valid_session
      expect(response).to redirect_to(wall_photos_url)
    end
  end

end
