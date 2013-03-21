class AddSoundAndDataToRapnsCampaigns < ActiveRecord::Migration
  def self.up
    add_column :rapns_campaigns, :data, :text
    add_column :rapns_campaigns, :sound, :string, :default => "default"
  end

  def self.down
    remove_column :rapns_campaigns, :sound
    remove_column :rapns_campaigns, :data
  end
end
