# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100419021037) do

  create_table "admins", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["confirmation_token"], :name => "index_admins_on_confirmation_token", :unique => true
  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faqs", :force => true do |t|
    t.string   "question"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_notifications", :force => true do |t|
    t.text     "params"
    t.integer  "subscription_id"
    t.string   "status"
    t.string   "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", :force => true do |t|
    t.string   "nom"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", :force => true do |t|
    t.string   "email",                               :default => "",        :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",        :null => false
    t.string   "password_salt",                       :default => "",        :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "login"
    t.string   "company"
    t.string   "address"
    t.string   "zipcode"
    t.string   "city"
    t.string   "state"
    t.string   "telephone"
    t.string   "fax"
    t.string   "mobile"
    t.string   "contact_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",                              :default => "pending"
  end

  add_index "providers", ["confirmation_token"], :name => "index_providers_on_confirmation_token", :unique => true
  add_index "providers", ["email"], :name => "index_providers_on_email", :unique => true
  add_index "providers", ["reset_password_token"], :name => "index_providers_on_reset_password_token", :unique => true

  create_table "salesmen", :force => true do |t|
    t.string   "name"
    t.string   "mobile_phone"
    t.integer  "provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "search_profiles", :force => true do |t|
    t.string   "category"
    t.integer  "minprice"
    t.integer  "maxprice"
    t.integer  "minkilometer"
    t.integer  "maxkilometer"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "selections", :force => true do |t|
    t.integer  "user_id"
    t.integer  "vehicle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "plan_id"
    t.datetime "subscription_date"
    t.string   "status"
    t.integer  "provider_id"
    t.string   "subscriber_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                              :null => false
    t.string   "encrypted_password",   :limit => 40, :null => false
    t.string   "password_salt",                      :null => false
    t.string   "confirmation_token",   :limit => 20
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token", :limit => 20
    t.string   "remember_token",       :limit => 20
    t.datetime "remember_created_at"
    t.integer  "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "mobile"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "vehicles", :force => true do |t|
    t.string   "type"
    t.integer  "price"
    t.integer  "kilometrage"
    t.date     "annee"
    t.string   "immatriculation"
    t.string   "serialnumber"
    t.string   "modele"
    t.integer  "marque_id"
    t.string   "cylindree"
    t.string   "energy"
    t.string   "boite_vitesse"
    t.text     "description"
    t.string   "overviewpic_file_name"
    t.integer  "overviewpic_file_size"
    t.string   "overviewpic_content_type"
    t.datetime "overviewpic_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "select_for_week",          :default => false
    t.integer  "category_id"
    t.string   "backpic_file_name"
    t.string   "backpic_content_type"
    t.integer  "backpic_file_size"
    t.datetime "backpic_updated_at"
    t.string   "frontpic_file_name"
    t.string   "frontpic_content_type"
    t.integer  "frontpic_file_size"
    t.datetime "frontpic_updated_at"
    t.string   "rfrontpic_file_name"
    t.string   "rfrontpic_content_type"
    t.integer  "rfrontpic_file_size"
    t.datetime "rfrontpic_updated_at"
    t.string   "lfrontpic_file_name"
    t.string   "lfrontpic_content_type"
    t.integer  "lfrontpic_file_size"
    t.datetime "lfrontpic_updated_at"
    t.string   "rbackpic_file_name"
    t.string   "rbackpic_content_type"
    t.integer  "rbackpic_file_size"
    t.datetime "rbackpic_updated_at"
    t.string   "lbackpic_file_name"
    t.string   "lbackpic_content_type"
    t.integer  "lbackpic_file_size"
    t.datetime "lbackpic_updated_at"
    t.integer  "provider_id"
    t.boolean  "disponibilite",            :default => true
    t.integer  "salesman_id"
  end

end
