class User < ApplicationRecord
  def missing_token?
    !token.present?
  end

  def valid_token?
    # use an example request to check if the
    # token of the user is valid
    uberzeit.timer.ok?
  end

  def uberzeit
    @uberzeit ||= uberzeit_client.new(self)
  end

  private
  def uberzeit_client
    Rails.application.config.x.uberzeit_client
  end
end
