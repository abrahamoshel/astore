class AddInfoToEmployees < ActiveRecord::Migration
  def self.up
    add_column :employees, :firstName, :string
    add_column :employees, :lastName, :string
    add_column :employees, :userName, :string
  end

  def self.down
    remove_column :employees, :userName
    remove_column :employees, :lastName
    remove_column :employees, :firstName
  end
end
