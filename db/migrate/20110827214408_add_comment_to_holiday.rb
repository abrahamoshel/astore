class AddCommentToHoliday < ActiveRecord::Migration
  def self.up
    add_column :holidays, :comment, :text
  end

  def self.down
    remove_column :holidays, :comment
  end
end
