module Commands
  class Base
    def initialize(user: nil, parameters: nil)
      @user = user
      @parameters = parameters
    end

    def run
      raise NotImplementedError, "Must be implemented in a subclass of Commands::Base"
    end
  end
end
