class Admin::DashBoardController < ApplicationController
  layout 'admin'
  before_action :is_admin, only: %i[index]

  def index
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
