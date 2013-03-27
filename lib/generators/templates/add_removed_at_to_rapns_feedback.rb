class AddRemovedAtToRapnsFeedback < ActiveRecord::Migration
  def self.up
    add_column :rapns_feedback, :removed_at, :datetime
  end

  def self.down
    remove_column :rapns_feedback, :removed_at
  end
end
