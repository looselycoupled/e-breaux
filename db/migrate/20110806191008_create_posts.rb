class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :identifier
      t.integer :target_id
      t.string :message
      t.datetime :fb_created_time

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
