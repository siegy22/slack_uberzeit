require 'test_helper'

class VersionTest < ActiveSupport::TestCase
  test "print version" do
    assert_equal "You're using version `0.1.1` of slack_uberzeit
Checkout https://github.com/siegy22/slack_uberzeit for updates.", Commands::Version.new.run
  end

  def version
    File.read(Rails.root + "VERSION")
  end
end
