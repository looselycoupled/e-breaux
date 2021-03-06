class CreateResponses < ActiveRecord::Migration
  def self.up
    create_table :responses do |t|
      t.integer :facebook_id
      t.integer :post_id
      t.integer :comment_id
      t.datetime :respond_at

      t.timestamps
    end
  end

  def self.down
    drop_table :responses
  end
end
