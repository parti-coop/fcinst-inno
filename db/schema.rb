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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170213031639) do

  create_table "interviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "name",                          null: false
    t.string   "organization"
    t.string   "image"
    t.text     "message",         limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.text     "summary",         limit: 65535
    t.string   "image_thumbnail"
    t.string   "image_mobile"
  end

  create_table "proposals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC" do |t|
    t.string   "title",                     null: false
    t.string   "image"
    t.integer  "interview_id",              null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "upvotes_count", default: 0
    t.index ["interview_id"], name: "index_proposals_on_interview_id", using: :btree
  end

end
