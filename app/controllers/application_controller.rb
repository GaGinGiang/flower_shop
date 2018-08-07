class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :set_locale
  before_action :category
  before_action :session_cart
  protect_from_forgery with: :exception
  include SessionsHelper
  def category
    @categories = Category.all
  end


  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def session_cart
    @cart = session[:cart] || {}
    if @cart.present?
      @products_cart = @cart.map {|id, quantity| [Flower.find_by(id: id), quantity]}
      @count_product_cart = @cart.length
      @total = total_cart @products_cart
    end
  end
end
