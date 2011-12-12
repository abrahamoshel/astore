class CreateManagers < ActiveRecord::Migration
  def self.up
    create_table :managers do |t|
      t.integer :holiday_id
      t.string :name
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :managers
  end
end
