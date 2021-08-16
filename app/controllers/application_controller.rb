class ApplicationController < ActionController::Base
  include RansackMemory::Concern # insert this line

  before_action :save_and_load_filters # insert this line after Devise auth before filter (Devise gem is not necessary)
end
