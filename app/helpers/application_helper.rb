module ApplicationHelper
  def display_content(content)
    return "" if content.nil?
    content.body.html_safe&.gsub("data-src", "abc")&.gsub("src", "no-image")&.gsub("abc", "src").html_safe
  end

end
