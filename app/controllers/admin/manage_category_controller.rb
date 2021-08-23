class Admin::ManageCategoryController < ApplicationController
  layout 'admin'
  before_action :is_admin, only: %i[index]

  def show_categories
    @categories = Category.all
  end

  def show_articles
    @category = Category.find_by(id: params[:id])
    @articles = @category.products.all.page(params[:page])
  end

  private
  def is_admin
    if session[:user_id].nil?
      redirect_to root_path
    else
      user = User.find_by(id: session[:user_id])
      unless user.is_admin
        redirect_to root_path
      end
    end
  end

end
