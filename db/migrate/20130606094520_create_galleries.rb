class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.string :name 
      t.text :desc
      t.string :presimage
      t.boolean :activate, :default => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :galleries
  end
end
