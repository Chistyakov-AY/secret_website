# frozen_string_literal: true

# Comments
class ApplicationController < ActionController::Base
  include Pundit::Authorization
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_author

  before_action :authenticate_user!

  before_action :set_locale

  def default_url_options
    { lang: I18n.locale }
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  # def user_not_author
  #   flash[:notice] = 'Удалять и изменять пост может только автор!'
  #   redirect_to(request.referer || root_path)
  # end
end
