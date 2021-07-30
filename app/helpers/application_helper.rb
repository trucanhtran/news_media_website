module ApplicationHelper
  def group(product_id)
    html = "".html_safe
    arr_content = []
    product = Product.find_by(id: product_id)
    html << product.content.squish
    html
  end

  def get_time(product_id)
    product = Product.find_by(id: product_id)
    updated_time = product.updated_at.strftime("%H")
    time = Time.now.strftime("%H").to_i - updated_time.to_i
    return time.to_s
  end
end
