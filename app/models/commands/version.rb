module Commands
  class Version < Base
    def run
      "You're using version `#{version}` of slack_uberzeit\nCheckout https://github.com/siegy22/slack_uberzeit for updates."
    end

    def version
      Rails.application.config.x.version
    end
  end
end
