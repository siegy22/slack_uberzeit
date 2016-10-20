module Commands
  def self.get(cmd, uberzeit, time_type)
    {
      nil => Commands::Show.new(uberzeit),
      "info" => Commands::Show.new(uberzeit),
      "start" => Commands::Start.new(uberzeit, time_type),
      "stop" => Commands::Stop.new(uberzeit),
    }.fetch(cmd, Commands::Unknown.new)
  end
end
