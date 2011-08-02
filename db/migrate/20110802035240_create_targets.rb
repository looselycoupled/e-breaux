class CreateTargets < ActiveRecord::Migration
  def self.up
    create_table :targets do |t|
      t.string :first_name
      t.string :last_name
      t.string :identifier

      t.timestamps
    end
  end

  def self.down
    drop_table :targets
  end
end
