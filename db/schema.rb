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

ActiveRecord::Schema.define(version: 20150307164908) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blog_entries", force: :cascade do |t|
    t.string   "name"
    t.text     "summary"
    t.string   "url"
    t.datetime "published_at"
    t.string   "guid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "blog_image_file_name"
    t.string   "blog_image_content_type"
    t.integer  "blog_image_file_size"
    t.datetime "blog_image_updated_at"
  end

  create_table "contact_requests", force: :cascade do |t|
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

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "developers", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email"
    t.string   "github"
    t.string   "blog"
    t.text     "bio",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
    t.string   "twitter"
  end

  create_table "freshbooks_invoices", force: :cascade do |t|
    t.string   "invoice_id",         null: false
    t.string   "number",             null: false
    t.string   "organization",       null: false
    t.string   "client_id",          null: false
    t.string   "status",             null: false
    t.decimal  "amount",             null: false
    t.decimal  "amount_outstanding", null: false
    t.decimal  "paid",               null: false
    t.string   "public_url",         null: false
    t.date     "date",               null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "freshbooks_invoices", ["invoice_id"], name: "index_freshbooks_invoices_on_invoice_id", unique: true, using: :btree

  create_table "freshbooks_payments", force: :cascade do |t|
    t.string   "payment_id",           null: false
    t.string   "invoice_id",           null: false
    t.string   "client_id",            null: false
    t.string   "payment_type",         null: false
    t.string   "currency_code",        null: false
    t.string   "gateway_reference_id"
    t.string   "gateway_name"
    t.text     "notes"
    t.decimal  "amount",               null: false
    t.decimal  "from_credit",          null: false
    t.date     "date",                 null: false
    t.date     "updated",              null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

end
