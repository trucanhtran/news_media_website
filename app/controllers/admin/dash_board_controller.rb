class Admin::DashBoardController < ApplicationController
  layout 'admin'
  before_action :is_admin, only: %i[index]

  def index
    @user = User.new
    @category = Category.all
    @product = Product.new
  end


  def create_article
    @product = product.new(article_params)
    if @user.save
      redirect_to admin_dash_board_path
    else
      render :index
      flash.now[:error] = "Tạo tài khoản thất bại"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :is_admin)
  end

  def article_params
    params.require(:product).permit(:title, :description, :content, :category_id)
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
