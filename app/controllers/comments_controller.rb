# frozen_string_literal: true

# Класс по созданию/редактировани и удалению обьектов класса Comment.
class CommentsController < ApplicationController
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

  # Запрос на создание нового обьекта класса Comment.
  #
  # @return Возвращает переменную экземпляра класса Comment
  #
  # @example @comment
  #
  # @example_return [#Comment]
  def new
    @comment = @post.comments.new
  end

  # Метод создания нового обьекта класса Comment.
  #
  # @return В случае валидного создания объекта возвращает переменную экземпляра класса Comment и перенаправляет на страницу 
  # просмотра определенного поста, в противном случае перенаправляет на страницу создания нового комментария с flash уведомлением.
  #
  # @example post '/post_comments'
  #
  # @example_return [#Comment]
  def create
    @comment = @post.comments.new(comment_params)

    @comment.save ? (redirect_to post_path(@post), notice: t('.comment_created')) : (render :new, status: :unprocessable_entity)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
