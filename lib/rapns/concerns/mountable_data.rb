module MountableData
  extend ActiveSupport::Concern

  included do
    include Rapns::MultiJsonHelper
    attr_accessible :url
  end

  def url
    loaded_data = data
    loaded_data['url'] if loaded_data.present?
  end

  def url=(value)
    if value.present?
      self.data ||= {}
      self.data = data.merge({'url' => value})
    else
      self.data = data.reject{ |k, v| k == 'url' }
    end
  end

  def data
    dumped_data = read_attribute(:data)
    dumped_data.present? ? multi_json_load(dumped_data) : {}
  end
end
