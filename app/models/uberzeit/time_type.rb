class Uberzeit
  class TimeType
    DEFAULT = 1

    def self.all
      uberzeit_client.new.time_types.map do |tt|
        new(tt)
      end.select(&:work?)
    end

    def self.for_text(text)
      all.detect { |tt| tt.name.downcase == String(text).downcase }
    end

    attr_reader :id, :name

    def initialize(opts)
      @id = opts["id"]
      @name = opts["name"]
      @is_work = opts["is_work"]
    end

    def work?
      @is_work
    end

    private
    def self.uberzeit_client
      Rails.application.config.x.uberzeit_client
    end
  end
end
