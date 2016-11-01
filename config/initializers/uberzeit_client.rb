Rails.application.config.x.uberzeit_client = if Rails.env.test?
                                               require Rails.root + "test/support/mock_uberzeit"
                                               MockUberzeit
                                             else
                                               Uberzeit
                                             end
