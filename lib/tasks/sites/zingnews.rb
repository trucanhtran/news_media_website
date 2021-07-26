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

    arr_category.each do |link|
      begin
        current_category = link[:category_link]
        get_product_links(current_category, link[:category])
      rescue
        puts "Error: #{link}"
      end
    end
  end

  def collect_category(raw_home_page)
    arr_category = []
    raw_home_page.css("#zing-header nav.category-menu ul li.parent").each do |link|
      begin
        category_name = link.at_css('a').values.last
        category_link =  @url + link.at_css('a').values.first
        category = Category.find_or_create_by(name: category_name)
        arr_category << {category_link: category_link, category_name: category_name, category: category}
      rescue
        puts "Error category here #{link}"
      end
    end
    arr_category
  end

  def get_product_links(current_category, category)
    arr_product_list = []
    document = using_nokogiri(current_category)
    document.css(".section-content .article-list .article-item").each do |link|
      begin
        product_link = @url + link.css(".article-title a").first['href']
        product_thumbnail= link.css(".article-thumbnail a img").first['data-src']
        arr_product_list << {product_link: product_link, product_thumbnail: product_thumbnail}
      rescue
        puts "Error: #{link}"
      end
    end

    arr_product_list.each do |link|
      begin
        current_product = link[:product_link]
        product_thumbnail = link[:product_thumbnail]
        get_product_details(current_product,product_thumbnail, category)
      rescue
        puts "Error: #{link}"
      end
    end
  end

  def get_product_details(current_product,product_thumbnail, category)
    arr_product_detail = []
    document = using_nokogiri(current_product)
    title = document.css(".the-article-header .the-article-title").first.content
    # author = document.at_css(".the-article-author a")
    description = document.css(".main .the-article-summary").first.content
    content = document.css(".main .the-article-body").first.inner_html
    thumbnail = product_thumbnail
    product = Product.find_by(title: title)
    if product.present?
      product.description = description
      product.content = content
      product.thumbnail = thumbnail
      product.save
      p product.content
    else
      new_product = category.products.create(title: title, description: description, content: content, thumbnail: thumbnail)
      p new_product.content
    end
  end

end
