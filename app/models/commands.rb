module Commands
  def self.get(cmd, uberzeit)
    {
      "" => Commands::Show.new(uberzeit),
      "on" => Commands::Start.new(uberzeit),
      "off" => Commands::Stop.new(uberzeit),
    }.fetch(cmd, Commands::Unknown.new)
  end
end
