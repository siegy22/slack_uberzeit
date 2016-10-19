module Commands
  class Start
    def initialize(uberzeit)
      @uberzeit = uberzeit
    end

    def run
      response = @uberzeit.start_timer
      if response.created?
        "Your timer has been started!"
      elsif response.unprocessable_entity?
        "There's already a timer running"
      else
        "There was an error starting your timer"
      end
    end
  end
end
