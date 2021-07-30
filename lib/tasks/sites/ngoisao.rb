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
        category_link = link[:category_link]
        get_product_links(category_link, link[:category])
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
        category = Category.find_or_create_by(name: category_name)
        arr_category << {category_link: category_link, category: category}
      rescue
        puts "Error category here: #{category_link}"
      end
    end
    arr_category
   end

  def get_product_links(current_category_link, current_category)
    arr_product_list = []
    document = using_nokogiri(current_category_link)
    document.css(".art_item .content .title_news").each do |link|
      begin
        product_link = link.css('a').first['href']
        arr_product_list << {product_link: product_link}
      rescue
        puts "Error get product link here: #{product_link}"
      end
    end
    arr_product_list.each do |link|
      begin
        get_product_details(link[:product_link], current_category)
      rescue
        byebug
        puts "Error product here: #{link[:product_link]}"
      end
    end
  end

  def get_product_details(current_product_link, current_category)
    document = using_nokogiri(current_product_link)
    byebug
    product_title = document.at_css("h1.title-detail").content
    byebug
    product_description = document.at_css("p.lead").content
    if product_description == nil
      product_description = document.at_css("p.description").content
    end
    byebug
    product_content = document.css(".fck_detail").first.inner_html
    byebug
    product = Product.find_by(title: product_title)
    if product.present?
      product.description = product_description
      product.content = product_content
      product.save
      puts "Update product: #{product.title}"
    else
      new_product = current_category.products.create(title: product_title, description: product_description, content: product_content)
      puts "Create product: #{product.title}"
    end
  end

end
