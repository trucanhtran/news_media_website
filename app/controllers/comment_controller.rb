class CommentController < ApplicationController
  before_action :get_article, only: [:get_comment]

  def get_comment
    comment = Comment.new(content: params[:comment], user_id: params[:userId], product_id: params[:articleId])
    if comment.save
      render json: comment
    else
      redirect_to show_product_path(params[:articleId])
    end
  end

private

def comment_params
  params.permit(:content)
end

def get_article
  article = Product.find_by(id: params[:id])
end


end
