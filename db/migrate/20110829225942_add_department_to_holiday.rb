class AddDepartmentToHoliday < ActiveRecord::Migration
  def self.up
    add_column :holidays, :department, :string
  end

  def self.down
    remove_column :holidays, :department
  end
end
