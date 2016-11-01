class Uberzeit
  include HTTParty
  base_uri ENV["UBERZEIT_URL"]

  DEFAULT_TIME_TYPE = 1

  def initialize(user = nil)
    @user = user
  end

  def start_timer(time_type)
    self.class.post("/api/timer",
                    headers: headers,
                    body: {
                      time_type_id: time_type,
                    })
  end

  def stop_timer
    self.class.put("/api/timer",
                   headers: headers,
                   body: {
                     "end" => true
                   })
  end

  def timer
    self.class.get("/api/timer", headers: headers)
  end

  def time_types
    self.class.get("/api/time_types")
  end

  def activities
    self.class.get("/api/activities")
  end

  private
  def headers
    {
      "X-Auth-Token" => @user.token
    }
  end
end
