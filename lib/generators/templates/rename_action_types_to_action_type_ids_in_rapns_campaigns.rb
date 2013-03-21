class RenameActionTypesToActionTypeIdsInRapnsCampaigns < ActiveRecord::Migration
  def self.up
    rename_column :rapns_campaigns, :action_types, :action_type_ids
  end

  def self.down
    rename_column :rapns_campaigns, :action_type_ids, :action_types
  end
end
