class AddCatalogIdsToRapnsCampaigns < ActiveRecord::Migration
  def self.up
    add_column :rapns_campaigns, :catalog_ids, :text
  end

  def self.down
    remove_column :rapns_campaigns, :catalog_ids
  end
end
