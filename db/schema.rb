# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131202155235) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contact_requests", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "business_name"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "dev_team"
    t.string   "product_status"
    t.boolean  "test_suite"
    t.boolean  "ci_server"
    t.boolean  "deploy_master"
    t.boolean  "onestep_deploy"
    t.boolean  "bugs_not_issue"
    t.boolean  "releases_not_issue"
    t.boolean  "infrastructure_not_issue"
    t.boolean  "agile_product"
    t.boolean  "week_sprints"
    t.boolean  "weekly_retros"
    t.boolean  "analytics"
  end

end
