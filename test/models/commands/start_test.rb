require 'test_helper'

class CommandsStartTest < ActiveSupport::TestCase
  test "start timer" do
    cmd = build_command(["arbeit"], created: true)
    assert_equal "Your timer has been started!", cmd.run
  end

  test "start timer with custom time type" do
    cmd = build_command(["homeoffice"], created: true)
    assert_equal "Your timer has been started!", cmd.run
  end

  test "start timer with custom time type that does not exist" do
    cmd = build_command(["no exist"])
    assert_equal "Cannot find time type called \"no exist\"\n" +
      "Available: Arbeit, Homeoffice", cmd.run
  end

  test "start timer if already started" do
    cmd = build_command(["arbeit"], unprocessable_entity: true)
    assert_equal "There's already a timer running", cmd.run
  end

  def build_command(time_type, options = {})
    response = MockResponse.new(options)
    MockUberzeit.response = response
    Commands::Start.new(users(:jack), time_type)
  end
end
