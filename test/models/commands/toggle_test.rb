require 'test_helper'

class CommandsToggleTest < ActiveSupport::TestCase
  test "starts the timer if it's not running" do
    cmd = build_command(status: :not_found)
    # as I can't change the mock response's while the toggle command
    # checks for an existing timer, this will return the fallback in Commands::Start#run
    assert_equal "There was an error starting your timer", cmd.run
  end

  test "stops the timer if it's running" do
    cmd = build_command(status: :ok)
    assert_equal "Your timer was stopped!", cmd.run
  end

  def build_command(options = {})
    MockUberzeit.response = MockResponse.new(options)
    Commands::Toggle.new(user: users(:jack))
  end
end
