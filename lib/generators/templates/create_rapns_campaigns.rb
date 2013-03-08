class CreateRapnsCampaigns < ActiveRecord::Migration
  def self.up
    create_table :rapns_campaigns do |t|
      t.string :name, :null => false
      t.text :description
      t.integer :app_id

      t.timestamps
    end

    add_index :rapns_campaigns, :app_id
  end

  def self.down
    drop_table :rapns_campaigns
  end
end
