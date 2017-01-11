module Commands
  class Unknown < Base
    def run
      "Unkown command, please try again.\nAvailable commands: #{available_commands.join(", ")}"
    end

    private
    def available_commands
      Dir[Rails.root.join("app/models/commands/*")].map do |cmd|
        File.basename(cmd, ".rb")
      end - ["base", "unknown"]
    end
  end
end
