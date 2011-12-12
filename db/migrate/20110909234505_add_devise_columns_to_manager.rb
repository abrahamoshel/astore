class AddDeviseColumnsToManager < ActiveRecord::Migration
  def self.up
    change_table :managers do |t|
      t.string :encrypted_password, :null => false, :default => '', :limit => 128
      t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      t.string :firstName
      t.string :lastName
      t.string :userName
      t.boolean :god_mode
      t.boolean :reports_only
    end

  end

  def self.down
    change_table :managers do |t|
      t.remove :encrypted_password
      t.remove :password_salt
      t.remove :authentication_token
      t.remove :confirmation_token
      t.remove :confirmed_at
      t.remove :confirmation_sent_at
      t.remove :reset_password_token
      t.remove :reset_password_sent_at
      t.remove :remember_token
      t.remove :remember_created_at
      t.remove :sign_in_count
      t.remove :current_sign_in_at
      t.remove :last_sign_in_at
      t.remove :current_sign_in_ip
      t.remove :last_sign_in_ip
      t.remove :failed_attempts
      t.remove :unlock_token
      t.remove :locked_at
      t.remove :firstName
      t.remove :lastName
      t.remove :userName
      t.remove :god_mode
      t.remove :reports_only
    end
  end
end
