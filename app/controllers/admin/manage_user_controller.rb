class Admin::ManageUserController < ApplicationController
  layout 'admin'
  before_action :is_admin, only: %i[index]

  def new_admin
    @user = User.new
  end

  def create_admin
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_show_admins_path
    else
      redirect_to admin_new_admin_path
    end
  end

  def show_admins
    @admins = User.where(is_admin: true).where.not(id: session[:user_id])
  end

  def edit_admin
    @user = User.find_by(id: params[:id])
  end

  def update_admin
    @user = User.find_by(id: params[:id])
    if  @user.update(user_params)
      redirect_to admin_show_admins_path, notice: 'Update thành công'
    else
      render :edit_admin
      flash.now[:error] = 'Lỗi'
    end
  end

  def delete_admin
    user = User.find_by(id: params[:id])
    user.destroy
    redirect_to admin_dash_board_path, notice: 'Bạn đã xóa user'
  end

  def search_user_type
    is_admin = params[:user_type] == 'admin'
    users =  User.left_joins(:products)
      .select('users.id, users.name, users.email, count(users.id) as total_products')
      .where(is_admin: is_admin)
      .group(:id)
      .order('users.id asc')
    render json: users
  end

  def sort_by_date
    users = User
      .left_joins(:products)
      .select('users.id, users.name, users.email, count(users.id) as total_products')
      .group(:id)
      .order("users.updated_at #{params[:created_at]}")

    render json: users
  end

  def sort_by_quantity
    users = User
      .left_joins(:products)
      .select('users.id, users.name, users.email, count(users.id) as total_products')
      .group(:id)
      .order("count(users.id) #{params[:quantity]}")

    render json: users
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :is_admin)
  end

  def is_admincdcd
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
