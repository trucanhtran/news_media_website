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
        get_product_links(link[:category_link], link[:category_name])
      rescue
        puts "Error: #{link}"
      end
    end
  end

  def collect_category(raw_home_page)
    arr_category = []
    raw_home_page.css("#main_menu_new li").each.with_index do |link, index|
      next if index == 0
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

  def get_product_links(current_category_link, current_category_name)
    category = Category.find_or_create_by(name: current_category_name)
    arr_product_list = []
    document = using_nokogiri(current_category_link)
    document.css(".art_item").each do |link|
      begin
        product_link = link.css('.content .title_news a').first['href']
        arr_product_list << {product_link: product_link}
      rescue
        puts "Error get product link here: #{product_link}"
      end
    end
    p arr_product_list
  end

  def get_product_details(current_product_thumbnail, current_product_title, current_product_links)
    document = using_nokogiri(current_category_link)
  end

end
