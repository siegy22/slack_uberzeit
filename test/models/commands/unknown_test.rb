require 'test_helper'

class CommandsUnknownTest < ActiveSupport::TestCase
  test "default unknown message" do
    assert_equal "Unkown command, please try again.
Available commands: configure, info, start, stop, toggle, version", Commands::Unknown.new.run
  end
end
