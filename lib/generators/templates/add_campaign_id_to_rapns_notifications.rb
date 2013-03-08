class AddCampaignIdToRapnsNotifications < ActiveRecord::Migration
  def self.up
    add_column :rapns_notifications, :campaign_id, :integer

    add_index :rapns_notifications, :campaign_id
    add_index :rapns_notifications, [:app_id, :campaign_id]
  end

  def self.down
    remove_index :rapns_notifications, [:app_id, :campaign_id]
    remove_index :rapns_notifications, :campaign_id

    remove_column :rapns_notifications, :campaign_id
  end
end
