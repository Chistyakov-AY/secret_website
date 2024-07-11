# require "spec_helper"
require "rails_helper"
require 'byebug'

RSpec.describe CommentsController, type: :controller do
  let!(:user1) { create :user}
  let!(:post1) { create :post}
  let!(:comment1) { create :comment}
  
  before { 
    user1.confirm
    login user1 
  }

  describe "#index action" do
    it "render index template if comments is found" do #ok
      get :index, params: {post_id: post1.id}
      response.should render_template('index')
    end

    it "returns a success response" do #ok
      get :index, params: {post_id: post1.id}
      expect(response).to have_http_status(:ok)
    end

    it "status response == 200" do #ok
      get :index, params: {post_id: post1.id}
      expect(response.status).to eq(200)
    end
  end

  describe "#new action" do
    it "render new template if comments is found" do #ok
      get :new, params: {post_id: post1.id}
      response.should render_template('new')
    end

    it "assigns a blank subscription to the view" do #ok
      get :new, params: {post_id: post1.id}
      expect(assigns(:comment)).to be_a_new(Comment)
    end

    it "returns a success response" do #ok
      get :new, params: {post_id: post1.id}
      expect(response).to have_http_status(:ok)
    end

    it "status response == 200" do #ok
      get :new, params: {post_id: post1.id}
      expect(response.status).to eq(200)
    end
  end

  describe "#create action" do
    it "save?" do
      post :create, params: { post_id: post1.id, comment: { body: "Test" } } #ok
      response.should redirect_to(post_path(post1.id))
    end
    
    it "render template new if validation pass" do
      post :create, params: { post_id: post1.id, comment: { body: nil } } #ok
      response.should render_template('new')
    end

    it "returns a success response" do
      get :create, params: { post_id: post1.id, comment: { body: "Test" } }
      expect(response).to have_http_status(:redirect)
    end

    it "status response == 200" do 
      get :create, params: { post_id: post1.id, comment: { body: "Test" } }
      expect(response.status).to eq(302)
    end
  end
end