class CreateRequests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.text :comment
      t.date :startDate
      t.date :endDate

      t.timestamps
    end
  end

  def self.down
    drop_table :requests
  end
end
