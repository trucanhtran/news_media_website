class Api::UserController < ActionController::API
  def index
    users = User.all
    render json: users, status: 200
  end

  def create
    user = User.new(user_param)
    if user.save
      render json: user, status: :created
    else
      render json: {error: 'Tạo user thất bại'}, status: :not_found
    end
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user, status: 200
  end

  def delete
    user = User.find_by(id: params[:id])
    if user.present?
      user.destroy
      render status: :ok
    else
      render json: {error: 'Không xóa được user'}, status: 400
    end
  end

  def update
    user = User.find_by(id: params[:id])
    if user.present?
      user.update(user_param)
      render json: user, status: :ok
    else
      render json: {error: 'Không cập nhật được user'}, status: 400
    end
  end

  private

  def user_param
    params.require(:user).permit(:name, :email, :password)
  end
end
