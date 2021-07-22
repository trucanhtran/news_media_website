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
    collect_category(raw_home_page)
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
    puts arr_category
    arr_category
  end

end
