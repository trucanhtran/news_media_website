module ApplicationHelper
  def display_content(content)
    return "" if content.nil?
    content.gsub("data-src", "zzz").gsub("src", "src1").gsub("zzz", "src").html_safe
  end

  def get_time(product_id)
    product = Product.find_by(id: product_id)
    updated_time = product.updated_at.strftime("%H")
    time = Time.now.strftime("%H").to_i - updated_time.to_i
    return time.to_s
  end
end
