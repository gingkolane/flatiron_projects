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

ActiveRecord::Schema.define(version: 2019_06_17_083433) do

  create_table "cars", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conditions", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.text "CONDITION", limit: 4294967295
  end

  create_table "conditions_studies", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.text "NCT_ID", limit: 4294967295
    t.integer "condition_id"
    t.integer "study_id"
  end

  create_table "interventions", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.text "INTERVENTION_NAME", limit: 4294967295
    t.text "INTERVENTION_TYPE", limit: 4294967295
    t.text "DESCRIPTION", limit: 4294967295
  end

  create_table "interventions_studies", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.integer "intervention_id"
    t.integer "study_id"
    t.text "NCT_ID", limit: 4294967295
  end

  create_table "investigators", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.text "NAME_DEGREE", limit: 4294967295
    t.text "ROLE", limit: 4294967295
    t.text "FACILITY_NAME", limit: 4294967295
    t.text "CITY", limit: 4294967295
    t.text "STATE", limit: 4294967295
    t.text "ZIP", limit: 4294967295
    t.text "COUNTRY", limit: 4294967295
  end

  create_table "investigators_studies", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.integer "study_id"
    t.integer "investigator_id"
    t.text "NCT_ID", limit: 4294967295
  end

  create_table "sponsors", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.text "SPONSOR_TYPE", limit: 4294967295
    t.text "AGENCY", limit: 4294967295
    t.text "AGENCY_CLASS", limit: 4294967295
    t.text "NCT_ID", limit: 4294967295, null: false
  end

  create_table "sponsors_studies", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.text "NCT_ID", limit: 4294967295
    t.integer "sponsor_id"
    t.integer "study_id"
  end

  create_table "studies", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.text "NCT_ID", limit: 4294967295
    t.text "BRIEF_TITLE", limit: 4294967295
    t.text "BRIEF_SUMMARY", limit: 4294967295
    t.text "OVERALL_STATUS", limit: 4294967295
    t.text "START_DATE", limit: 4294967295
    t.text "START_DATE_TYPE", limit: 4294967295
    t.text "COMPLETION_DATE", limit: 4294967295
    t.text "COMPLETION_DATE_TYPE", limit: 4294967295
    t.text "PHASE", limit: 4294967295
    t.text "STUDY_TYPE", limit: 4294967295
    t.text "ENROLLMENT_TYPE", limit: 4294967295
    t.text "ENROLLMENT", limit: 4294967295
    t.text "CRITERIA", limit: 4294967295
    t.text "GENDER", limit: 4294967295
    t.text "MINIMUM_AGE", limit: 4294967295
    t.text "MAXIMUM_AGE", limit: 4294967295
    t.text "URL", limit: 4294967295
  end

end
