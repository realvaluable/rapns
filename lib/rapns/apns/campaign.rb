module Rapns
  module Apns
    class Campaign < Rapns::Base
      self.table_name = 'rapns_campaigns'

      serialize :catalog_ids
      serialize :action_type_ids
      serialize :data

      belongs_to :app, :class_name => 'Rapns::App'

      attr_accessor :url
      attr_accessible :name, :description, :app_id, :badge, :alert, :action_type_ids, :catalog_ids, :attributes_for_device, :sound, :data, :url

      validates_presence_of :name, :app_id

      alias_attribute :attributes_for_device, :data

      def url
        data_attribute = read_attribute(:data)
        data_attribute ? data_attribute['url'] : ''
      end

      def url=(attr)
        if attr.present?
          self.data = (data || {}).merge('url' => attr)
        else
          data.delete('url')
          self.data = data
        end
      end

      def data=(attrs)
        return unless attrs
        raise ArgumentError, 'must be a Hash' if !attrs.is_a?(Hash)
        super attrs.merge(data || {})
      end
    end
  end
end
