module Commands
  class Stop
    def initialize(user)
      @user = user
    end

    def run
      response = @user.uberzeit.stop_timer
      handler = ResponseHandler.new(response, {
                                      ok: "Your timer was stopped!",
                                      not_found: "There's no timer to stop",
                                      fallback: "There was an error stopping your timer",
                                    })
      handler.message
    end
  end
end
