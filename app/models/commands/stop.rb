module Commands
  class Stop
    def initialize(uberzeit)
      @uberzeit = uberzeit
    end

    def run
      response = @uberzeit.stop_timer
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
