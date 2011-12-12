class CreateHolidays < ActiveRecord::Migration
  def self.up
    create_table :holidays do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.date :firstStart
      t.date :firstEnd
      t.date :secondStart
      t.date :secondEnd
      t.date :thirdStart
      t.date :thirdEnd

      t.timestamps
    end
  end

  def self.down
    drop_table :holidays
  end
end
