class ZingnewsController < ApplicationController
  def index
    @categories = Category.all.limit(10)
    @products = Product.all.limit(5)
    @hot_product = Product.all.order(updated_at: :desc).first
    @hot_products = Product.all.order(updated_at: :desc).limit(2).offset(1)
  end
end
