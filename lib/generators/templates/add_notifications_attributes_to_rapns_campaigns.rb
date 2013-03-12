class AddNotificationsAttributesToRapnsCampaigns < ActiveRecord::Migration
  def self.up
    add_column :rapns_campaigns, :badge, :integer, :null => true
    add_column :rapns_campaigns, :alert, :string,  :null => true
  end

  def self.down
    remove_column :rapns_campaigns, :alert
    remove_column :rapns_campaigns, :badge
  end
end
