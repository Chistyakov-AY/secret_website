require "rails_helper"

RSpec.describe PostsController, type: :controller do

  describe "#index action" do
    it "render index template if posts is found" do 
      get :index, params: {post_id: post1.id}
      response.should render_template('index')
    end

    it "route_to admin/comments#index" do 
      expect(get: 'admin/comments').to route_to(controller: "admin/comments", action: "index")
    end

    it "returns a success response" do 
      get :index, params: {post_id: post1.id}
      expect(response).to have_http_status(:ok)
    end

    it "status response == 200" do 
      get :index, params: {post_id: post1.id}
      expect(response.status).to eq(200)
    end
  end
 
  # it_render_404_page_when_post_is_not_found :show, :edit, :update, :destroy

  # describe "Index action" do
    # it "render index template if comments s found" do
    #   get :, {:title, :body}
      
    # end
    

  #   it "returns a success response" do
  #     get :index
  #     expect(response).to have_http_status(:ok)
  #   end

  #   it "responds successfully" do
  #     get :index
  #     expect(response.status).to eq(200)
  #   end

  # end

  # describe "create action" do
  #   it "save?" do
        # post :create, post: {title: "title", body: "body"}
        # response.should redirect_to(posts_url) # assigns(:post)
  #   end
    
  #   it "render template new if validaton pass" do
        # post :create, post: {title: "title", body: nil}
        # response.should render_template('new') # assigns(:post)
  #   end

      # it "render 403 if user not admin" do
      #   post :create, post: {title: "title", body: "body"}
      #   response.status.should == 403
      # end
  # end 

#   describe "destroy action" do
#     it "redirect to posts_path when post destroy" do
#       post = create(:post)
#       delete :destroy, id: post.id
#       response.should redirect_to(posts_path)
#     end

#     it "render 404 if post not find" do
#       delete :destroy, id: 0
#       response.status.should == 404
#     end
#   end 
# end

# RSpec.describe PostsController do
#   describe "GET new" do
#     it "assigns @posts" do
#       post = Post.create
#       get :index
#       expect(assigns(:posts)).to eq([post])
#     end

#     it "renders the index template" do
#       get :index
#       expect(response).to render_template("index")
#     end
#   end

end