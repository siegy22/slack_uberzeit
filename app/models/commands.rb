module Commands
  # Get the command class by a string
  # If nil is passed as command it will return Commands::Toggle.
  # Every command responds to +run+ which will return a string, which is the result of the command execution
  # ==== Examples
  #   Commands.get('start', user, parameters) # => #<Commands::Start ...>
  #   Commands.get(nil, user, parameters) # => #<Commands::Toggle ...>
  def self.get(cmd, user, parameters)
    cmd ||= 'toggle'
    Object.const_get("Commands::#{cmd.classify}")
      .new(user: user, parameters: parameters)
  rescue NameError
    Commands::Unknown.new
  end
end
