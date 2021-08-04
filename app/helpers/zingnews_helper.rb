module ZingnewsHelper
  def get_time(updated_time)
    current_time = Time.zone.now
    duration = current_time - updated_time
    time = duration / 3600
    time.round(0)
  end
end
