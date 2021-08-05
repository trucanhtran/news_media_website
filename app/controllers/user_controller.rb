class UserController < ApplicationController
  layout "login_template"

  def login

  end

  def check_user
    user = User.find_by(email: session_params[:email])
    if user.present? && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      if user.is_admin
        redirect_to admin_dash_board_path
      else
        redirect_to root_path
      end
    else
      render :login
    end
  end

  def signup
    @user = User.new
  end

  def create_user
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to root_path
    end
  end

  def show_user

  end

  def logout
    session.clear
    redirect_to login_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def session_params
    params.permit(:email, :password)
  end
end
