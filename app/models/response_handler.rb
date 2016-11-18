class ResponseHandler
  def initialize(response, handle)
    @response = response
    @fallback = handle.delete(:fallback)
    @handle = handle.inject({}) do |memo, k_and_v|
      http_msg, msg = k_and_v
      status_code = Rack::Utils::SYMBOL_TO_STATUS_CODE[http_msg]
      memo[status_code] = msg
      memo
    end
  end

  def message
    @handle.fetch(@response.code) do
      Rails.logger.log(@response.inspect)
      @fallback
    end
  end
end
