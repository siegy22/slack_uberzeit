module Commands
  def self.get(cmd, user, parameters)
    {
      nil => Commands::Show.new(user),
      "info" => Commands::Show.new(user),
      "start" => Commands::Start.new(user, parameters),
      "stop" => Commands::Stop.new(user),
      "configure" => Commands::Configure.new(user, parameters)
    }.fetch(cmd, Commands::Unknown.new)
  end
end
