class ZingnewsController < ApplicationController
  def index
    @categories = Category.all
  end
end
