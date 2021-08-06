class SearchController < ApplicationController
  before_action :get_data, only: %i[show_result]
  layout "search_template"

  def show_result
    @products = Product.where("lower(title) LIKE ?", "%#{params[:keyword]}%").limit(15)
  end

  def search_items
    @products = Product.where("lower(title) LIKE ?", "%#{params[:keyword]}%").limit(15)
  end

  private

  def get_data
    @categories = Category.all.limit(10)
  end
end
