class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    my_posts = params[:my] == '1' ? current_user.posts : Post
    @posts = my_posts.order(updated_at: :desc).page params[:page]
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_path, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
      redirect_to posts_path, notice: "Post was successfully destroyed."
    end
  end

  # def like
  #   @post = Post.find(params[:id])
  #   if (params[:format]) == 'like'
  #     @post.liked_by current_user
  #   elsif params[:format] == 'unlike'
  #     @post.unliked_by current_user
  #   end
  #   redirect_back fallback_location: root_path
  # end

  # def dislike
  #   @post = Post.find(params[:id])
  #   if params[:format] == 'dislike'
  #     @post.disliked_by current_user
  #   elsif params[:format] == 'undislike'
  #     @post.undisliked_by current_user
  #   end
  #   redirect_back fallback_location: root_path
  # end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :name, :image)
  end