module Commands
  class Start
    def initialize(user, parameters)
      @user = user
      @parameters = parameters
    end

    def run
      validator = TimeValidator.new(time)
      if validator.ok?
        response = @user.uberzeit.start_timer(time)
        handler = ResponseHandler.new(response, {
                                        created: "Your timer has been started!",
                                        unprocessable_entity: "There's already a timer running",
                                        fallback: "There was an error starting your timer",
                                      })
        handler.message
      else
        "Oops! #{time} does not look like a time.\n" +
          "The time format must be: HH:MM"
      end
    end

    private
    def time
      @parameters.first
    end
  end
end
