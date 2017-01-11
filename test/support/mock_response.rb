class MockResponse
  def initialize(status: nil, duration: nil)
    @status_msg = status
    @duration = duration
  end

  def [](key)
    if key == 'duration'
      @duration
    end
  end

  def code
    Rack::Utils::SYMBOL_TO_STATUS_CODE[@status_msg]
  end

  def method_missing(name, *args)
    name.to_s == "#{@status_msg}?"
  end
end
