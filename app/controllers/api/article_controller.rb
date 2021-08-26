class Api::ArticleController < ActionController::API
  def index
    articles = Product.all
    render json: articles, status: :ok
  end

  def show
    article = Product.find_by(id: params[:id])
    if article.present?
      render json: article, status: :ok
    else
      render json: {error: "Không tìm thấy dữ liệu của ID #{params[:id]}"}, status: :not_found
    end
  end

  def create
    article = Product.new(article_params)
    if article.save!
      render json: article, status: :ok
    else
      render json: {error: "Không thể tạo article"}, status: :not_found
    end
  end

  def update
    article = Product.find_by(id: params[:id])
    if article.present?
      article.update(article_params)
      render json: article, status: :ok
    else
      render json: {error: "Không thể update user"}, status: :not_found
    end
  end

  def delete
    article = Product.find_by(id: params[:id])
    if article.present?
      article.destroy
      render status: :ok
    else
      render json: {error: "Không thể xóa"}, status: :not_found
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :thumbnail, :description, :content, :hot_new, :user_id, :category_id)
  end
end
