module Commands
  class Show
    def initialize(uberzeit)
      @uberzeit = uberzeit
    end

    def run
      duration = @uberzeit.timer["duration"]
      "You have been working for #{duration}"
    end
  end
end
