module Commands
  class Start
    def initialize(user, parameters)
      @user = user
      @parameters = parameters
    end

    def run
      unless time_type
        return unknown_time_type_message(@parameters.first,
                                         Uberzeit::TimeType.all.map(&:name))
      end

      response = @user.uberzeit.start_timer(time_type)
      if response.created?
        "Your timer has been started!"
      elsif response.unprocessable_entity?
        "There's already a timer running"
      else
        "There was an error starting your timer"
      end
    end

    private
    def time_type
      if @parameters.empty?
        Uberzeit::TimeType::DEFAULT
      elsif time_type = Uberzeit::TimeType.for_text(@parameters.first)
        time_type.id
      else
        nil
      end
    end

    def unknown_time_type_message(given, available)
      "Cannot find time type called \"#{given}\"\n" +
        "Available: #{available.join(", ")}"
    end
  end
end
