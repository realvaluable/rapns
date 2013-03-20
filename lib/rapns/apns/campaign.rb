module Rapns
  module Apns
    class Campaign < Rapns::Base
      self.table_name = 'rapns_campaigns'

      serialize :catalog_ids
      serialize :action_types

      belongs_to :app, :class_name => "Rapns::App"

      attr_accessible :name, :description, :app_id, :badge, :alert, :action_types, :catalog_ids

      validates_presence_of :name, :app_id
    end
  end
end
