require 'test_helper'

class ApiTest < ActionDispatch::IntegrationTest
  test "example api call to configure api key" do
    MockUberzeit.response = MockResponse.new(status: :ok)

    api_token = "d5cf34936790429e20d3b11f862c6cf2"
    post api_path, params: {
      user_name: "johnny_cash",
      token: ENV["SLACK_TOKEN"],
      text: "configure #{api_token}"
    }
    assert_equal "You're all set!\nYou can now use `/uberzeit start` to start your timer.", response.body
    assert_equal api_token, users(:john).token
  end
end
