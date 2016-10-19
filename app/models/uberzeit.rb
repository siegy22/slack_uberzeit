class Uberzeit
  include HTTParty
  base_uri ENV["UBERZEIT_URL"]

  def initialize(user)
    @user = user
  end

  def start_timer
    self.class.post("/api/timer",
                    headers: headers,
                    body: {
                      time_type_id: 1,
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

  private
  def headers
    {
      "X-Auth-Token" => api_token
    }
  end

  def api_token
    Rails.application.config.users[@user]
  end
end
