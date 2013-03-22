module RapnsCustomConnection
  extend ActiveSupport::Concern

  included do
    establish_connection "apns_#{Rails.env}"
  end
end
