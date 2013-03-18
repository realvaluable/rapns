class AddSentAtToRapnsCampaigns < ActiveRecord::Migration
  def self.up
    add_column :rapns_campaigns, :sent_at, :datetime
  end

  def self.down
    remove_column :rapns_campaigns, :sent_at
  end
end
