class MockUberzeit
  def self.response=(res)
    @@mock_response = res
  end

  def self.reset_response
    @@mock_response = nil
  end

  def initialize(_user = nil)
  end

  def start_timer(time_type)
    @@mock_response
  end

  def stop_timer
    @@mock_response
  end

  def timer
    @@mock_response
  end

  def example_request
    @@mock_response
  end
end
