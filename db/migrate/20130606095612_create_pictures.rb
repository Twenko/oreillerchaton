class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.string :name
      t.string :desc
      t.string :path
      t.integer :gallery_id
      t.boolean :activate, :default => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :pictures
  end
end
