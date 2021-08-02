class SearchItemsController < ApplicationController
  def show_result
    @products = Product.where("lower(title) ? LIKE", "%#{params[:keyword]}%")
  end
end
