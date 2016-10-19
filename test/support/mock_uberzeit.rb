class MockUberzeit
  DEFAULT_TIME_TYPE = 1

  def initialize(user,
                 timer: {},
                 start_timer_response: nil,
                 stop_timer_response: nil)
    @user = user
    @timer = timer
    @start_timer_response = start_timer_response
    @stop_timer_response = stop_timer_response
  end

  def start_timer(time_type)
    @start_timer_response
  end

  def stop_timer
    @stop_timer_response
  end

  def timer
    @timer
  end

  def time_types
    [
     {"id" => 1,"name" => "Arbeit", "is_work" => true},
     {"id" => 2,"name" => "Krank", "is_work" => false},
     {"id" => 3,"name" => "Ferien", "is_work" => false},
     {"id" => 4,"name" => "Homeoffice", "is_work" => true},
    ]
  end
end
