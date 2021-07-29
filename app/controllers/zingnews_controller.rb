class ZingnewsController < ApplicationController
  before_action :get_data, only: %[index]

  def index
    @products = Product.all.limit(5)
    @hot_product = Product.all.order(updated_at: :desc).first
    @hot_products = Product.all.order(updated_at: :desc).limit(2).offset(1)
    @book = Category.find_by(name: 'Sách hay')
    @book_products = @book.products.all
    @latest_products = Product.all.order(updated_at: :desc).limit(30)

  end

  def show_category
    @category = Category.find_by(id: params[:id])
    @products = @category.products.all
  end

  private

  def get_data
    @categories = Category.all.limit(10)
  end

end
