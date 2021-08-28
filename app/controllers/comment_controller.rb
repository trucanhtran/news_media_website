class CommentController < ApplicationController
  before_action :get_article, only: [:get_comment]

  def get_comment
    @comment = Comment.new(comment_params)
    if @comment.save
    redirect_to show_product_path(article.id), notice: "Bình luận thành công"
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
