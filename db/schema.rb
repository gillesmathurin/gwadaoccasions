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

ActiveRecord::Schema.define(:version => 20100304121358) do

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
  end

end