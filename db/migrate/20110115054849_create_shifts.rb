class CreateShifts < ActiveRecord::Migration
  def self.up
    create_table :shifts do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :shiftType
      t.date :date
      t.time :starttime
      t.time :endtime
      t.string :takingFirstName
      t.string :takingLastName
      t.string :takingEmail

      t.timestamps
    end
  end

  def self.down
    drop_table :shifts
  end
end
