class AddDeliverAfterToRapnsCampaigns < ActiveRecord::Migration
  def self.up
    add_column :rapns_campaigns, :deliver_after, :datetime
  end

  def self.down
    remove_column :rapns_campaigns, :deliver_after
  end
end
