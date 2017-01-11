require 'test_helper'

class CommandsShowTest < ActiveSupport::TestCase
  test "show with active timer" do
    MockUberzeit.response = { "duration" => "05:22" }
    cmd = Commands::Info.new(user: users(:jack))
    assert_equal "You have been working for 05:22", cmd.run
  end

  test "show help text if no active timer" do
    MockUberzeit.response = {}
    cmd = Commands::Info.new(user: users(:jack))
    assert_equal "You need to start your timer using `/uberzeit start`\n" +
      "Then, check back again!", cmd.run
  end
end
