module Rapns
  module Apns
    class Campaign < Rapns::Base
      self.table_name = 'rapns_campaigns'

      belongs_to :app, :class_name => "Rapns::App"

      attr_accessible :name, :description, :app_id

      validates_presence_of :name, :app_id
    end
  end
end
