require 'test_helper'

class CommandsTest < ActiveSupport::TestCase
  test "get show command if empty" do
    assert_instance_of Commands::Show, get_command(nil)
  end

  test "get show command if info" do
    assert_instance_of Commands::Show, get_command("info")
  end

  test "get start command" do
    assert_instance_of Commands::Start, get_command("start")
  end

  test "get stop command" do
    assert_instance_of Commands::Stop, get_command("stop")
  end

  test "get unknown command (any command will result in this)" do
    assert_instance_of Commands::Unknown, get_command("no exist")
  end

  def get_command(str)
    Commands.get(str, nil, nil)
  end
end
