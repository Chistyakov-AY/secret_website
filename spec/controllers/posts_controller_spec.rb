# frozen_string_literal: true
require "rails_helper"

RSpec.describe PostsController, type: :controller do
  let!(:user1) { sign_in create(:user) }
  let!(:post1) { create :post }
  let!(:comment1) { create :comment }
  
  # before { 
  #   user1.confirm
  #   login user1 
  # }

  it "#index" do #ok
    get :index
    response.should render_template('index')
    expect(response).to have_http_status(:ok)
    # expect(response.status).to eq(200)
  end

  describe "#new" do
    it "without params" do #ok
      get :new
      response.should render_template('new')
      expect(assigns(:post)).to be_a_new(Post)
    end
    
    it "with params" do #ok
      get :new, params: {id: post1.id}
      expect(response).to have_http_status(:ok)
      # expect(response.status).to eq(200)
    end
  end

  describe "#create" do
    it "with params" do #ok
      post :create, params: { post: { title: "Test", body: "Test" } }
      response.should redirect_to(posts_path)
      expect(response).to have_http_status(:redirect)
      expect(Post.first.attributes["id"]).to eq(post1.id)
      # expect(response.status).to eq(302)
    end

    it "with params, body - nil" do #ok
      post :create, params: { post: { title: "Test", body: nil } }
      response.should render_template('new')
    end
  end

  describe "#update" do
    it "with params" do #ok
      put :update, params: { id: post1.id, post: { title: "Test", body: "Test" } }
      response.should redirect_to(posts_path)
      expect(response).to have_http_status(:redirect)
      # expect(response.status).to eq(302)
    end

    it "with params, body - nil" do #ok
      post :update, params: { id: post1.id, post: { title: "Test", body: nil } }
      response.should render_template('edit')
    end
  end

  it "#destroy" do #ok
    delete :destroy, params: { id: post1.id }
    response.should redirect_to(posts_path)
    # response.status.should == 302
  end
end