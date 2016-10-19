require 'test_helper'

class CommandsStartTest < ActiveSupport::TestCase
  test "start timer" do
    cmd = build_command(1, created: true)
    assert_equal "Your timer has been started!", cmd.run
  end

  test "start timer with custom time type" do
    cmd = build_command("homeoffice", created: true)
    assert_equal "Your timer has been started!", cmd.run
  end

  test "start timer with custom time type that does not exist" do
    cmd = build_command("no exist")
    assert_equal "Cannot find time type called \"no exist\"\n" +
      "Available: Arbeit, Homeoffice", cmd.run
  end

  test "start timer if already started" do
    cmd = build_command(1, unprocessable_entity: true)
    assert_equal "There's already a timer running", cmd.run
  end

  def build_command(time_type = 1, options = {})
    response = MockResponse.new(options)
    uberzeit = MockUberzeit.new "test", start_timer_response: response
    Commands::Start.new(uberzeit, time_type)
  end
end
