class ApiController < ApplicationController
  def api
    cmd = Commands.get(command, uberzeit, time_type)
    @message = cmd.run
    render plain: @message
  end

  private
  def command
    text_parts.first
  end

  def time_type
    if text_parts.size == 1
      Uberzeit::DEFAULT_TIME_TYPE
    else
      text_parts.last
    end
  end

  def uberzeit
    @uberzeit ||= Uberzeit.new(params[:user_name])
  end

  def text_parts
    params[:text].split(" ")
  end
end
