class ApplicationController < ActionController::API
  before_action :verify_slack_token!

  private
  def verify_slack_token!
    unless params[:token] == ENV["SLACK_TOKEN"]
      head :bad_request
    end
  end
end
