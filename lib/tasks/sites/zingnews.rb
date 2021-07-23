require 'nokogiri'
require 'rubygems'
require 'open-uri'

class ZingNews
  attr_accessor :url

  def initialize
    @url = "https://zingnews.vn"
  end

  def using_nokogiri(current_url)
    doc = Nokogiri::HTML(URI.open(current_url))
  end

  def start_parsing
    raw_home_page = using_nokogiri(@url)
    arr_category = collect_category(raw_home_page)

    arr_category.each do |category|
      current_category = category[:category_link]
      get_product_links(current_category)
    end
  end

  def collect_category(raw_home_page)
    arr_category = []
    raw_home_page.css("#zing-header nav.category-menu ul li.parent").each do |link|
      begin
        category_name = link.at_css('a').values.last
        category_link =  @url + link.at_css('a').values.first
        arr_category << {category_link: category_link, category_name: category_name}
        Category.find_or_create_by(name: category_name)
      rescue
        puts "Error category here #{link}"
      end
    end
    arr_category
  end

  def get_product_links(current_category)
    arr_product_list = []
    document = using_nokogiri(current_category)
    document.css(".section-content .article-list .article-item").each do |link|
      product_link = @url + link.css(".article-title a").first['href']
      product_thumbnail = link.css(".article-thumbnail a img").first['src']
      arr_product_list << {product_link: product_link, product_thumbnail: product_thumbnail}
    end

    arr_product_list.each do |link|
      current_product = link[:product_link]
      get_product_details(current_product)
    end
  end

  def get_product_details(current_product)
    arr_product_detail = []
    document = using_nokogiri(current_product)
    title = document.css(".the-article-header .the-article-title").first.content
    # author = document.css("ul.the-article-meta li.the-article-author a")
    description = document.css(".main .the-article-summary").first.content
    content = document.css(".main .the-article-body").first.content
  end

end
