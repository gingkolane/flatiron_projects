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

ActiveRecord::Schema.define(version: 2019_05_29_160317) do

  create_table "conditions", primary_key: "condition_id", force: :cascade do |t|
    t.text "CONDITION", limit: 200
  end

  create_table "interventions", primary_key: "intervention_id", force: :cascade do |t|
    t.text "INTERVENTION_NAME", limit: 1000
    t.text "INTERVENTION_TYPE", limit: 100
    t.text "DESCRIPTION"
  end

  create_table "investigators", primary_key: "investigator_id", force: :cascade do |t|
    t.text "NAME_DEGREE", limit: 150
    t.text "ROLE", limit: 100
    t.text "FACILITY_NAME", limit: 500
    t.text "CITY", limit: 100
    t.text "STATE", limit: 100
    t.text "ZIP", limit: 50
    t.text "COUNTRY", limit: 50
  end

  create_table "sponsors", primary_key: "sponsor_id", force: :cascade do |t|
    t.text "SPONSOR_TYPE", limit: 50
    t.text "AGENCY", limit: 200
    t.text "AGENCY_CLASS", limit: 50
    t.text "study_id", limit: 50, null: false
  end

  create_table "studies", force: :cascade do |t|
    t.text "study_id", limit: 50
    t.text "BRIEF_TITLE", limit: 500
    t.text "BRIEF_SUMMARY"
    t.text "OVERALL_STATUS", limit: 200
    t.text "START_DATE", limit: 50
    t.text "START_DATE_TYPE", limit: 50
    t.text "COMPLETION_DATE", limit: 50
    t.text "COMPLETION_DATE_TYPE", limit: 50
    t.text "PHASE", limit: 50
    t.text "STUDY_TYPE", limit: 100
    t.text "ENROLLMENT_TYPE", limit: 50
    t.text "ENROLLMENT", limit: 11
    t.text "CRITERIA"
    t.text "GENDER", limit: 50
    t.text "MINIMUM_AGE", limit: 50
    t.text "MAXIMUM_AGE", limit: 50
    t.text "URL", limit: 250
  end

  create_table "study_conditions", force: :cascade do |t|
    t.text "study_id", limit: 50, null: false
    t.integer "condition_id", limit: 11
  end

  create_table "study_interventions", force: :cascade do |t|
    t.text "study_id", limit: 50, null: false
    t.integer "NO", limit: 11
    t.integer "intervention_id", limit: 11
  end

  create_table "study_investigators", force: :cascade do |t|
    t.text "study_id", limit: 50
    t.integer "investigator_id", limit: 20
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
