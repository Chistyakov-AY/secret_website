# frozen_string_literal: true

# Comments
class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update]
  before_action :set_post, only: %i[new create]

  # Запрос для отображения списка всех комментариев
  #
  # @return [Array] Возвращает массив со списком всех комментариев
  #
  # @example get '/comments'
  #
  # @example_return [#Comment, #Comment, #Comment...]
  def index
    @comments = Comment.all
  end

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.new(comment_params)

    @comment.save ? (redirect_to post_path(@post), notice: t('.comment_created')) : (render :new, status: :unprocessable_entity)
  end

  def update
    if @comment.update(comment_params)
      (redirect_to comment_url(@comment),
                   notice: t('.comment_update'))
    else
      (render :edit, status: :unprocessable_entity)
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
