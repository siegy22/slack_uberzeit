module Commands
  class Start
    def initialize(user, parameters)
      @user = user
      @parameters = parameters
    end

    def run
      begin
        # Check if the time is a valid time format
        Time.parse(time) if time.present?
      rescue ArgumentError
        return "Oops! #{time} does not look like a time.\n" +
          "The time format must be: HH:MM"
      end

      response = @user.uberzeit.start_timer(time)
      if response.created?
        "Your timer has been started!"
      elsif response.unprocessable_entity?
        "There's already a timer running"
      else
        "There was an error starting your timer"
      end

    end

    private
    def time
      @parameters.first
    end
  end
end
