# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110909234505) do

  create_table "employees", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstName"
    t.string   "lastName"
    t.string   "userName"
  end

  add_index "employees", ["email"], :name => "index_employees_on_email", :unique => true
  add_index "employees", ["reset_password_token"], :name => "index_employees_on_reset_password_token", :unique => true

  create_table "holidays", :force => true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.date     "firstStart"
    t.date     "firstEnd"
    t.date     "secondStart"
    t.date     "secondEnd"
    t.date     "thirdStart"
    t.date     "thirdEnd"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "manager_id"
    t.text     "comment"
    t.string   "department"
  end

  create_table "hours", :force => true do |t|
    t.integer  "request_id"
    t.date     "dates"
    t.string   "vacation"
    t.string   "sick"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "managers", :force => true do |t|
    t.integer  "holiday_id"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "firstName"
    t.string   "lastName"
    t.string   "userName"
    t.boolean  "god_mode"
    t.boolean  "reports_only"
  end

  create_table "requests", :force => true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.text     "comment"
    t.date     "startDate"
    t.date     "endDate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shifts", :force => true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.string   "shiftType"
    t.date     "date"
    t.time     "starttime"
    t.time     "endtime"
    t.string   "takingFirstName"
    t.string   "takingLastName"
    t.string   "takingEmail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
