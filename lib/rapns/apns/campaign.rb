module Rapns
  module Apns
    class Campaign < Rapns::Base
      self.table_name = 'rapns_campaigns'

      belongs_to :app, :class_name => "Rapns::App"

      attr_accessible :name, :description, :app_id, :badge, :alert, :action_types, :catalog_ids

      validates_presence_of :name, :app_id

      def catalog_ids=(ids)
        ids.select!(&:present?) if ids.is_a? Array
        write_attribute(:catalog_ids, ids)
      end

      def catalog_ids
        read_attribute(:catalog_ids).split(',')
      end

      def action_types=(action_types)
        action_types.select!(&:present?) if action_types.is_a? Array
        write_attribute(:action_types, action_types)
      end

      def action_types
        read_attribute(:action_types).split(',')
      end
    end
  end
end
