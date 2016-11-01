module Commands
  class Configure
    def initialize(user, parameters)
      @user = user
      @parameters = parameters
    end

    def run
      return "Please provide an API key!" if @parameters.empty?

      User.transaction do
        @user.update token: @parameters.first
        if @user.valid_token?
          @message = "You're all set!\nYou can now use `/uberzeit start` to start your timer."
        else
          @message = "The API key you provided is not valid!"
          raise ActiveRecord::Rollback
        end
      end

      @message
    end
  end
end
