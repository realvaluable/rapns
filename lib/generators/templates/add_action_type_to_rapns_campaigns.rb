class AddActionTypeToRapnsCampaigns < ActiveRecord::Migration
  def self.up
    add_column :rapns_campaigns, :action_type, :string
  end

  def self.down
    remove_column :rapns_campaigns, :action_type
  end
end
