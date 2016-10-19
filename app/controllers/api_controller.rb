class ApiController < ApplicationController
  def api
    uberzeit = Uberzeit.new(params[:user_name])
    command = Commands.get(params[:text], uberzeit)
    @message = command.run
    render plain: @message
  end
end
