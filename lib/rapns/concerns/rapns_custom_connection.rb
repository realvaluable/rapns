module RapnsCustomConnection
  extend ActiveSupport::Concern

  def self.included(base)
    base.class_eval do
      establish_connection "apns_#{Rails.env}"
    end
  end
end
