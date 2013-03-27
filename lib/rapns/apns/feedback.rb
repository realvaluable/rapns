module Rapns
  module Apns
    class Feedback < Rapns::Base
      self.table_name = 'rapns_feedback'

      attr_accessible :device_token, :failed_at, :app, :removed_at

      validates :device_token, :presence => true
      validates :failed_at, :presence => true

      validates_with Rapns::Apns::DeviceTokenFormatValidator
    end
  end
end