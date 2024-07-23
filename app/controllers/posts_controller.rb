# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  rescue_from Pundit::NotAuthorizedError, with: :user_not_author

  
  def index
    @posts = Post.order(updated_at: :desc).page params[:page]

  end

  def my_posts
    @my_posts = current_user.posts.order(updated_at: :desc).page params[:page]
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if authorize @post
        if @post.update(post_params)
          format.html { redirect_to posts_path, notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    @post.destroy if authorize @post
    redirect_to posts_path, notice: 'Post was successfully destroyed.'
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

  def user_not_author
    flash[:notice] = 'Удалять и изменять пост может только автор!'
    redirect_to(request.referer || root_path)
  end
end