require "rails_helper"

RSpec.describe PostsController, type: :controller do
  let!(:user1) { create :user}
  let!(:post1) { create :post}
  let!(:comment1) { create :comment}
  
  before { 
    user1.confirm
    login user1 
  }

  describe "#index action" do
    it "render index template if posts is found" do #ok
      get :index
      response.should render_template('index')
    end

    it "returns a success response" do #ok
      get :index
      expect(response).to have_http_status(:ok)
    end

    it "status response == 200" do #ok
      get :index
      expect(response.status).to eq(200)
    end
  end
 
  describe "#new action" do
    it "render new template if comments is found" do #ok
      get :new
      response.should render_template('new')
    end

    it "assigns a blank subscription to the view" do #ok
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end

    it "returns a success response" do #ok
      get :new, params: {id: post1.id}
      expect(response).to have_http_status(:ok)
    end

    it "status response == 200" do #ok
      get :new, params: {id: post1.id}
      expect(response.status).to eq(200)
    end
  end

  describe "#create action" do
    it "save?" do #ok
      post :create, params: { post: { title: "Test", body: "Test" } }
      response.should redirect_to(posts_path)
    end
    
    it "render template new if validation pass" do #ok
      post :create, params: { post: { title: "Test", body: nil } }
      response.should render_template('new')
    end

    it "returns a success response" do #ok
      get :create, params: { post: { title: "Test", body: "Test" } }
      expect(response).to have_http_status(:redirect)
    end

    it "status response == 302" do  #ok
      get :create, params: { post: { title: "Test", body: "Test" } }
      expect(response.status).to eq(302)
    end
  end

  describe "#update action" do
    it "update?" do #ok
      put :update, params: { id: post1.id, post: { title: "Test", body: "Test" } }
      response.should redirect_to(posts_path)
    end
    
    it "render template updare if validation pass" do #ok
      post :update, params: { id: post1.id, post: { title: "Test", body: nil } }
      response.should render_template('edit')
    end

    it "returns a success response" do #ok
      get :update, params: { id: post1.id, post: { title: "Test", body: "Test" } }
      expect(response).to have_http_status(:redirect)
    end

    it "status response == 302" do #ok
      get :update, params: { id: post1.id, post: { title: "Test", body: "Test" } }
      expect(response.status).to eq(302)
    end
  end

  describe "#destroy action" do
    it "redirect to posts_path when post destroy" do #ok
      delete :destroy, params: { id: post1.id }
      response.should redirect_to(posts_path)
    end

    it "status response == 302" do #ok
      delete :destroy, params: { id: 1 }
      response.status.should == 302
    end
  end
end