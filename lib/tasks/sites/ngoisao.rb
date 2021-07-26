require 'nokogiri'
require 'rubygems'
require 'open-uri'

class Ngoisao
  attr_accessor :url
  def initialize
    @url = "https://ngoisao.net"
  end

  def using_nokogiri(current_url)
    document = Nokogiri::HTML(URI.open(current_url))
  end

  def start_parsing
    raw_home_page = using_nokogiri(@url)
    arr_category = collect_category(raw_home_page)

    arr_category.each do |link|
      begin
        get_product_links(link[:category_link])
      rescue
        puts "Error: #{link}"
      end
    end
    byebug
  end

  def collect_category(raw_home_page)
    arr_category = []
    raw_home_page.css("#main_menu_new li").each do |link|
      begin
        category_link = @url + link.css("a").first['href']
        category_name = link.css("a").first['title']
        arr_category << {category_link: category_link, category_name: category_name}
      rescue
        puts "Error category here: #{link}"
      end
    end
  arr_category
  end

  def get_product_links(current_category)
    arr_product_list = []
    document = using_nokogiri(current_category)
  end

end
