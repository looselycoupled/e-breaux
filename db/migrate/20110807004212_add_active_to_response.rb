class AddActiveToResponse < ActiveRecord::Migration
  def self.up
    add_column :responses, :active, :boolean, :default => true
  end

  def self.down
    remove_column :responses, :active
  end
end
