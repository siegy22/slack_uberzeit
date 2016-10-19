class MockResponse
  def initialize(created: false,
                 unprocessable_entity: false,
                 ok: false,
                 not_found: false)
    @created              = created
    @unprocessable_entity = unprocessable_entity
    @ok = ok
    @not_found = not_found
  end

  def created?
    @created
  end

  def unprocessable_entity?
    @unprocessable_entity
  end

  def ok?
    @ok
  end

  def not_found?
    @not_found
  end

  def respond_to?(name)
    true
  end

  def method_missing(name, *args)
    false
  end
end
