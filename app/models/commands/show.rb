module Commands
  class Show
    def initialize(user)
      @user = user
    end

    def run
      timer = @user.uberzeit.timer
      duration = timer["duration"]
      if duration.present?
        "You have been working for #{duration}"
      else
        "You need to start your timer using `/uberzeit start`\n" +
          "Then, check back again!"
      end
    end
  end
end
