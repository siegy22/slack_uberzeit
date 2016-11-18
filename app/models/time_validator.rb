class TimeValidator
  HOUR_MINUTE_FORMAT = %r{\A\d{1,2}:\d{1,2}\z}

  def initialize(time)
    @time = time
  end

  def ok?
    if @time.nil?
      true
    else
      @time =~ HOUR_MINUTE_FORMAT && Time.parse(@time)
    end
  rescue ArgumentError
    false
  end
end
