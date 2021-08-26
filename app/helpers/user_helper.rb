module UserHelper
  def is_login?
    session[:user_id].present?
  end

  def current_user
    session[:user_id].present? ? User.find_by(id: session[:user_id]) : nil
  end

  def current_admin
    current_user.is_admin ? current_user : nil
  end
end
