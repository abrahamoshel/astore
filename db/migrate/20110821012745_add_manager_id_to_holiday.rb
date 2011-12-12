class AddManagerIdToHoliday < ActiveRecord::Migration
  def self.up
    add_column :holidays, :manager_id, :integer
  end

  def self.down
    remove_column :holidays, :manager_id
  end
end
