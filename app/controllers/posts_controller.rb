# frozen_string_literal: true

# Класс по созданию/редактировани и удалению обьектов класса Post.
class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  rescue_from Pundit::NotAuthorizedError, with: :user_not_author

  # Запрос для отображения списка всех постов отсортированных по убыванию
  #
  # @return [Array] Возвращает массив со списком всех постов
  #
  # @example get '/posts'
  #
  # @example_return [#Post, #Post, #Post...]
  def index
    @posts = Post.order(updated_at: :desc).page params[:page]
  end

  # Запрос для отображения списка всех своих постов отсортированных по убыванию
  #
  # @return [Array] Возвращает массив со списком всех постов автора
  #
  # @example get '/my_posts'
  #
  # @example_return [#Post, #Post, #Post...]
  def my_posts
    @my_posts = current_user.posts.order(updated_at: :desc).page params[:page]
  end

  # Запрос на создание нового обьекта класса Post.
  #
  # @return Возвращает переменную экземпляра класса Post
  #
  # @example @post
  #
  # @example_return [#Post]
  def new
    @post = Post.new
  end

  # Метод создания нового обьекта класса Post.
  #
  # @return В случае валидного создания объекта возвращает переменную экземпляра класса Post и перенаправляет на страницу всех постов,
  #         в противном случае перенаправляет на страницу создания нового поста с flash уведомлением.
  #
  # @example post '/posts'
  #
  # @example_return [#Post]
  def create
    @post = current_user.posts.new(post_params)

    @post.save ? (redirect_to posts_path, notice: t('.post_created')) : (render :new, status: :unprocessable_entity)
  end

  # Метод изменения существующего обьекта класса Post.
  #
  # @return В случае валидного изменения объекта возвращает переменную экземпляра класса Post и перенаправляет на страницу всех постов,
  #         в противном случае перенаправляет на страницу изменения поста с flash уведомлением.
  #
  # @example patch '/post'
  #
  # @example_return [#Post]
  def update
    return unless authorize @post

    @post.update(post_params) ? (redirect_to posts_path, notice: t('.post_updated')) : (render :edit, status: :unprocessable_entity)
  end

  # Метод удаления обьекта класса Post.
  #
  # @return Возвращает удаленный из модели обьект
  #
  # @example delete '/post'
  #
  # @example_return [#Post]
  def destroy
    @post.destroy if authorize @post
    redirect_to posts_path, notice: t('.post_destroy')
  end

  private

  # Метод осуществляет поиск обьекта в модели Post по передаваемому параметру.
  #
  # @return Возвращает обьект поиска
  #
  # @example_return [#Post]
  def set_post
    @post = Post.find(params[:id])
  end

  # Метод определяет параметры для проверки в модели Post.
  #
  # @return [#post_params] Возвращается метод post_params, c разрешёнными атрибутами модели Post - title, body, name и image.
  #
  # @example_return {:post, params: {title: 'title', body: 'body', name: 'name', image: 'image'}}
  def post_params
    params.require(:post).permit(:title, :body, :name, :image)
  end

  # Метод устанавливает уведомление во флеш-памяти и перенаправляет пользователя.
  #
  # @return [#post_params] Возвращается flash уведомление и перенаправляет на исходный адрес запроса или корневой путь.
  #
  # @example_return {flash: {notice: 'Удалять и изменять пост может только автор!'} }
  def user_not_author
    flash[:notice] = 'Удалять и изменять пост может только автор!'
    redirect_to(request.referer || root_path)
  end
end
