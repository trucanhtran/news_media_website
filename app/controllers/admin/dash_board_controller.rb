class Admin::DashBoardController < ApplicationController
  layout 'admin'
  before_action is_admin, only: %i[index]

  def index
  end

  private
  def
end
