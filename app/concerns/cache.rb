module Cache
  extend ActiveSupport::Concern
  
  @@cache = {}
  @@cache_time ||= 5.minutes
  
  def cache
    if @@cache[:data] && (Time.current < (@@cache[:time] + @@cache_time))
      @@cache[:data]
    end
  end
  
  def cache=(result)
    @@cache = { time: Time.current, data: result }
    result
  end
end