class User < ApplicationRecord
  def no_token?
    !token.present?
  end

  def uberzeit
    @uberzeit ||= uberzeit_client.new(self)
  end

  def valid_token?
    uberzeit.time_types.ok?
  end

  private
  def uberzeit_client
    Rails.application.config.x.uberzeit_client
  end
end
