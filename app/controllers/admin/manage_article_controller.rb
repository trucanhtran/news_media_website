class Admin::ManageArticleController < ApplicationController
  layout 'admin'
  before_action :is_admin, only: %i[index]

  def show_articles
    @products = Product.includes(:user, :category).page(params[:page])
  end

  def new_article
    @category = Category.all
    @product = Product.new
    @user = User.find_by(id: session[:user_id])
  end

  def create_article
    @user = User.find_by(id: session[:user_id])
    @product = Product.new(article_params)
    @product.user_id = @user.id
    if @product.save
      redirect_to admin_articles_path
    else
      render :show_articles
      flash.now[:error] = "Tạo tài khoản thất bại"
    end
  end

  def delete_article
    product = Product.find_by(id: params[:id])
    product.destroy
    redirect_to admin_articles_path, notice: 'Bạn đã xóa thành công!'
  end

  def edit_article
    @product = Product.find_by(id: params[:id])
    @category = Category.all
  end

  def update_article
    @product = Product.find_by(id: params[:id])
    if @product.update(article_params)
      redirect_to admin_articles_path, notice: 'Update thành công'
    else
      render :update_article
      flash.now[:error] = 'Lỗi'
    end
  end

  def sort_by_date
    sort_date = params[:date]
    products = Product.survey_products_by_date(sort_date).page(params[:page])

    render json: products
  end

  private

  def article_params
    params.require(:product).permit(:title, :description, :thumbnail, :content, :category_id, :hot_new)
  end

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
