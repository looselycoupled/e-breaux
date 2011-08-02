class CreateSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :subscriptions do |t|
      t.integer :facebook_id
      t.integer :target_id
      t.decimal :chance_to_take_action
      t.decimal :chance_to_like

      t.timestamps
    end
  end

  def self.down
    drop_table :subscriptions
  end
end
