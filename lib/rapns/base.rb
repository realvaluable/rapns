class Rapns::Base < ActiveRecord::Base
  self.abstract_class = true

  establish_connection "apns_#{Rails.env}"
end
