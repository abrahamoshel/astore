class CreateHours < ActiveRecord::Migration
  def self.up
    create_table :hours do |t|
      t.integer :request_id
      t.date :dates
      t.string :vacation
      t.string :sick

      t.timestamps
    end
  end

  def self.down
    drop_table :hours
  end
end
