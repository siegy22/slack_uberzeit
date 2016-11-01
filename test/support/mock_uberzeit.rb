class MockUberzeit
  def self.response=(res)
    $mock_response = res
  end

  def self.reset_response
    $mock_response = nil
  end

  def initialize(_user = nil)
  end

  def start_timer(time_type)
    $mock_response
  end

  def stop_timer
    $mock_response
  end

  def timer
    $mock_response
  end

  def activities
    $mock_response
  end

  def time_types
    [
     {"id" => 1, "name" => "Arbeit", "is_work" => true},
     {"id" => 2, "name" => "Krank", "is_work" => false},
     {"id" => 3, "name" => "Ferien", "is_work" => false},
     {"id" => 4, "name" => "Homeoffice", "is_work" => true},
    ]
  end
end
