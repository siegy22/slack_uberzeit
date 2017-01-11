module Commands
  class Toggle < Base
    def run
      if @user.timer_running?
        Commands::Stop.new(user: @user, parameters: @parameters).run
      else
        Commands::Start.new(user: @user, parameters: @parameters).run
      end
    end
  end
end
