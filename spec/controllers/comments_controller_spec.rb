# require "spec_helper"
require "rails_helper"

RSpec.describe CommentsController, type: :controller do
  describe "index action" do
    it "render index template if comments is found" do
      get :index
      response.should render_template('index')
    end

    it "returns a success response" do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it "responds successfully" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "new action" do
    it "render new template if comments is found" do
      get :new
      response.should render_template('new')
    end

    it "assigns a blank subscription to the view" do
      get :new
      expect(assigns(:comment)).to be_a_new(Comment)
    end
  end

  describe "create action" do
    it "save?" do
        post :create, comment: {body: "body"}
        response.should redirect_to(post_path(assigns(:post)))
    end
    
    it "render template new if validaton pass" do
        post :create, comment: {body: nil}
        response.should render_template('new')
    end

    it "render 403 if user not admin" do
      post :create, comment: {body: "body"}
      response.status.should == 403
    end
  end
  
  describe "destroy action" do
    it "redirect to comments_path when comment destroy" do
      comment = create(:comment)
      delete :destroy, id: comment.id
      response.should redirect_to(comments_path)
    end

    it "render 404 if post not find" do
      delete :destroy, id: 0
      response.status.should == 404
    end
  end

  # describe "Show action" do
  #   it "render show template if comment is found" do
  #     show = create(:show)
  #     get :show
  #     response.should render_template('show')
  #   end
  # end

  # context "POST create" do
  #   it "redirects to pending subscriptions page" do
  #     params = { subscription: { body: "Для теста" } }
  #     post :create, params
  #     expect(response).to redirect_to(post_path(self))
  #   end
  # end
end