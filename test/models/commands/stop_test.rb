require 'test_helper'

class CommandsStopTest < ActiveSupport::TestCase
  test "stop active timer" do
    cmd = build_command(ok: true)
    assert_equal "Your timer was stopped!", cmd.run
  end

  test "stop non-existing timer" do
    cmd = build_command(not_found: true)
    assert_equal "There's no timer to stop", cmd.run
  end

  def build_command(options)
    MockUberzeit.response = MockResponse.new(options)
    Commands::Stop.new(users(:jack))
  end
end
