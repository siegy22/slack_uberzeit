module Commands
  class Stop
    def initialize(user)
      @user = user
    end

    def run
      response = @user.uberzeit.stop_timer
      if response.ok?
        "Your timer was stopped!"
      elsif response.not_found?
        "There's no timer to stop"
      else
        "There was an error stopping your timer"
      end
    end
  end
end
