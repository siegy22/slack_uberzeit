require 'test_helper'

class CommandsStartTest < ActiveSupport::TestCase
  test "start timer without arguments (uberzeit uses current timestamp if nothing passed)" do
    cmd = build_command(nil, status: :created)
    assert_equal "Your timer has been started!", cmd.run
  end

  test "start timer with custom time" do
    cmd = build_command("07:34", status: :created)
    assert_equal "Your timer has been started!", cmd.run
  end

  test "start timer with invalid custom time" do
    cmd = build_command("74:11")
    assert_equal "Oops! 74:11 does not look like a time.\n" +
      "The time format must be: HH:MM", cmd.run
  end

  test "start timer if already started" do
    cmd = build_command(nil, status: :unprocessable_entity)
    assert_equal "There's already a timer running", cmd.run
  end

  def build_command(time, options = {})
    response = MockResponse.new(options)
    MockUberzeit.response = response
    Commands::Start.new(users(:jack), Array(time))
  end
end
