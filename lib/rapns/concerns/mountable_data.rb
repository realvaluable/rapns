module MountableData
  def self.included(base)
    base.class_eval do
      attr_accessible :url
    end
  end

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
end
