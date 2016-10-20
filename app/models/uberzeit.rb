class Uberzeit
  class UsernameMissing < StandardError; end

  include HTTParty
  base_uri ENV["UBERZEIT_URL"]

  DEFAULT_TIME_TYPE = 1

  def initialize(user)
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
    self.class.get("/api/time_types", headers: headers)
  end

  private
  def headers
    {
      "X-Auth-Token" => api_token
    }
  end

  def api_token
    token = Rails.application.config.users[@user]
    token || (raise UsernameMissing, "Cannot find API key for user called \"#{@user}\"")
  end
end
