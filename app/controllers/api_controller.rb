class ApiController < ApplicationController
  before_action :user_needs_token!

  def api
    cmd = Commands.get(command, user, cmd_parameters)
    @message = cmd.run
    render plain: @message
  end

  private
  def user_needs_token!
    unless user.has_token?
      render(plain: "You don't have your uberzeit API token setup.\n" +
             "Click the little heart in the footer of uberzeit to reveal your API token.\n" +
             "Then execute `/uberzeit configure <your-api-token>` to set it.")
    end
  end

  def user
    @user ||= User.find_or_create_by name: params[:user_name]
  end

  def command
    text_parts.first
  end

  def uberzeit
    @uberzeit ||= Uberzeit.new(user)
  end

  def text_parts
    params[:text].split(" ")
  end

  def cmd_parameters
    text_parts[1..-1]
  end
end
