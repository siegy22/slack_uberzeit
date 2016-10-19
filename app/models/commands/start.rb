module Commands
  class Start
    class UnknownTimeType < StandardError; end

    def initialize(uberzeit, time_type)
      @uberzeit = uberzeit
      @time_type = time_type
    end

    def run
      response = @uberzeit.start_timer(time_type)
      if response.created?
        "Your timer has been started!"
      elsif response.unprocessable_entity?
        "There's already a timer running"
      else
        "There was an error starting your timer"
      end
    rescue UnknownTimeType => e
      e.message
    end

    private
    def time_type
      if @time_type == Uberzeit::DEFAULT_TIME_TYPE
        @time_type
      else
        selectable = @uberzeit.time_types.select { |tt| tt["is_work"] }
        selectable_texts = selectable.map { |tt| tt["name"] }
        selected = selectable.detect { |tt| tt["name"].downcase == @time_type.downcase }
        if selected
          selected["id"]
        else
          raise UnknownTimeType, unknown_time_type_message(@time_type, selectable_texts)
        end
      end
    end

    def unknown_time_type_message(given, available)
      "Cannot find time type called \"#{given}\"\n" +
        "Available: #{available.join(", ")}"
    end
  end
end
