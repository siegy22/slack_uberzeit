class Uberzeit
  include HTTParty
  base_uri ENV["UBERZEIT_URL"]

  def initialize(user)
    @user = user
  end

  def start_timer(time)
    body = if time
             { start: time }
           else
             {}
           end
    post("/api/timer",
         headers: headers,
         body: body)
  end

  def stop_timer
    put("/api/timer",
        headers: headers,
        body: {
          "end" => true
        })
  end

  def timer
    get("/api/timer", headers: headers)
  end

  private
  def headers
    {
      "X-Auth-Token" => @user.token
    }
  end
end
