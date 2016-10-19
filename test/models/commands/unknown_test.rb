require 'test_helper'

class CommandsUnknownTest < ActiveSupport::TestCase
  test "default unknown message" do
    assert_equal "Unkown command, please try again.", Commands::Unknown.new.run
  end
end
