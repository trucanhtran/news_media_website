class SearchController < ApplicationController
  before_action :get_data, only: %i[show_result]

  def show_result
    @products = Product.where("lower(title) ? LIKE", "%#{params[:keyword]}%")
  end

  private

  def get_data
    @categories = Category.all.limit(10)
  end
end
