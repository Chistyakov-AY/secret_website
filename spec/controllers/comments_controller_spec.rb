# frozen_string_literal: true
require "rails_helper"

RSpec.describe CommentsController, type: :controller do
  let!(:user1) { sign_in create(:user) }
  let!(:post1) { create :post }
  let!(:comment1) { create :comment }
  let!(:comment2) { build :comment }
  
  # before { 
  #   user1.confirm
  #   login user1 
  # }

  it "#index" do #ok
    get :index, params: {post_id: post1.id}
    response.should render_template('index')
    expect(response).to have_http_status(:ok)
    # expect(response.status).to eq(200)
  end

  it "#new" do #ok
    get :new, params: {post_id: post1.id}
    response.should render_template('new')
    expect(assigns(:comment)).to be_a_new(Comment)
    expect(response).to have_http_status(:ok)
    # expect(response.status).to eq(200)
  end

  describe "#create" do
    it "with params" do
      post :create, params: { post_id: post1.id, comment: { body: "Test" } } #ok
      response.should redirect_to(post_path(post1.id))
      expect(response).to have_http_status(:redirect)
      expect(Comment.first.attributes["id"]).to eq(comment1.id)
      expect(comment2.attributes["id"]).to eq(nil)
      expect(comment1.attributes["id"]).not_to eq(nil)
      # expect(response.status).to eq(302)
    end
    
    it "with params, body - nil" do
      post :create, params: { post_id: post1.id, comment: { body: nil } } #ok
      response.should render_template('new')
      expect(Comment.first.attributes["id"]).to eq(comment1.id)
    end
  end
end