module ApplicationHelper

  def get_time(product_id)
    latest_product = Product.find_by(id: params[:product_id])
    latest_time = latest_product.updated_at.strftime("%H")
    current_time = Time.now.strftime("%H")
    time = current_time - latest_time
    return time
  end

end
