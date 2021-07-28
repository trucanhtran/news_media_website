require './lib/tasks/sites/zingnews.rb'
require './lib/tasks/sites/ngoisao.rb'

namespace :crawl do
  #https://zingnews.vn/
  desc "start crawling data form zingnews"
  task zing_news: :environment do
    ZingNews.new.start_parsing
  end

  #https://ngoisao.net/
  desc "start crawling data form ngoisao"
   task ngoisao: :environment do
    Ngoisao.new.start_parsing
  end
end
