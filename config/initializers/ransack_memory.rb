RansackMemory::Core.config = {
  param: :page, # this means the default Ransack param name for searching. You can change it
  session_key_format: '%manage_article_controller%_%sort_by_date%_%request_format%' # this means how the key used to store the information to the session will be stored. Currently it interpolates request parameters. You can customize it and use these vars to build a key that fits your needs
}
