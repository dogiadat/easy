class PagesController < ApplicationController
  def index
    @hot_restaurant = Restaurant.opening.hot_restaurant.opening.limit Settings.pages.hot_restaurant_limit
    @new_restaurant = Restaurant.opening.order_desc.limit Settings.pages.new_restaurant_limit
  end

  def show
    if valid_page?
      render template: "pages/#{params[:page]}"
    else
      render_404
    end
  end

  private
  def valid_page?
    File.exist? Pathname.new("#{Rails.root}/app/views/pages/#{params[:page]}.html.slim")
  end
end
