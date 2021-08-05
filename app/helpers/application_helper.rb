module ApplicationHelper
  def display_content(content)
    return "" if content.nil?
    content.gsub("data-src", "zzz").gsub("src", "src1").gsub("zzz", "src").html_safe
  end

end
