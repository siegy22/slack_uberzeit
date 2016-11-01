class User < ApplicationRecord
  def has_token?
    token.present?
  end

  def uberzeit
    @uberzeit ||= uberzeit_client.new(self)
  end

  def valid_token?
    uberzeit.activities.ok?
  end

  private
  def uberzeit_client
    Rails.application.config.x.uberzeit_client
  end
end
