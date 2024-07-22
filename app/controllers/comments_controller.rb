# frozen_string_literal: true
class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update ]
  before_action :set_post, only: %i[ new create ]

  def index
    @comments = Comment.all
  end

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.new(comment_params)
      if @comment.save
        redirect_to post_path(@post), notice: 'Comment was successfully created.' 
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_url(@comment), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
