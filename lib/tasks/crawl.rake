require './lib/tasks/sites/zingnews.rb'

namespace :crawl do
  #https://zingnews.vn/
  desc "start crawling data form zingnews"
  task zing_news: :environment do
    ZingNews.new.start_parsing
  end

end
