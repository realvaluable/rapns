class RenameActionTypeToActionTypesInRapnsCampaigns < ActiveRecord::Migration
  def self.up
    rename_column :rapns_campaigns, :action_type, :action_types
  end

  def self.down
    rename_column :rapns_campaigns, :action_types, :action_type
  end
end