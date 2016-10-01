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

ActiveRecord::Schema.define(version: 20161001133200) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "address_type_id"
    t.string   "address"
    t.string   "city"
    t.string   "zip_code"
    t.string   "state"
    t.string   "country_code"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "extend_demography_id"
    t.integer  "country_id"
    t.integer  "state_id"
    t.string   "second_address"
  end

  create_table "affiliations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "affiliation_type_id"
    t.text     "note",                limit: 65535
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "attachments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "type"
    t.string   "file"
    t.string   "description"
    t.integer  "owner_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "certifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "certification_type_id"
    t.integer  "user_id"
    t.date     "date_received"
    t.text     "note",                  limit: 65535
    t.date     "date_expired"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "file"
  end

  create_table "checklist_answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.boolean  "status"
    t.integer  "user_id"
    t.integer  "checklist_id"
    t.integer  "checklist_template_id"
    t.date     "due_date"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "checklist_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "checklist_type"
    t.integer  "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "title"
    t.text     "description",    limit: 65535
  end

  create_table "checklist_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "assigned_to_id"
    t.integer  "checklist_template_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "checklists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.boolean  "status"
    t.string   "description"
    t.date     "due_date"
    t.integer  "user_id"
    t.integer  "checklist_template_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "clearances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "clearence_type_id"
    t.integer  "user_id"
    t.date     "date_received"
    t.text     "note",              limit: 65535
    t.date     "date_expired"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "file"
  end

  create_table "contact_links", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "contact_to_id"
    t.integer  "contact_from_id"
    t.integer  "contact_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "contact_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.boolean  "emergency_contact"
    t.text     "note",              limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "contact_type_id"
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "file"
  end

  create_table "core_demographics", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.integer  "gender_id"
    t.date     "birth_date"
    t.integer  "religion_id"
    t.string   "title"
    t.text     "note",                limit: 65535
    t.integer  "ethnicity_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "citizenship_type_id"
  end

  create_table "departments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.text     "note",               limit: 65535
    t.date     "date_start"
    t.date     "date_end"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "department_type_id"
    t.integer  "organization_id"
  end

  create_table "documents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "title"
    t.text     "description",      limit: 65535
    t.integer  "user_id"
    t.integer  "document_type_id"
    t.date     "date"
    t.string   "attachment"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "educations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "education_type"
    t.string   "other_skill"
    t.date     "date_recieved"
    t.date     "date_expired"
    t.text     "note",                  limit: 65535
    t.integer  "clearence"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_id"
    t.integer  "education_type_id"
    t.integer  "certification_type_id"
    t.string   "file"
  end

  create_table "emails", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "email_address"
    t.integer  "email_type_id"
    t.integer  "extend_demography_id"
    t.text     "note",                 limit: 65535
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["extend_demography_id"], name: "index_emails_on_extend_demography_id", using: :btree
  end

  create_table "enabled_modules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "entended_demographics", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "identification_id"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "enumerations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "name",          limit: 30, default: "",    null: false
    t.integer "position"
    t.boolean "is_default",               default: false, null: false
    t.string  "type"
    t.boolean "active",                   default: true,  null: false
    t.string  "position_name", limit: 30
  end

  create_table "ethnicities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "ethnicity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "extend_demographies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "identification_id"
    t.string   "type"
    t.integer  "department_id"
    t.integer  "contact_id"
    t.integer  "organization_id"
    t.integer  "affiliation_id"
    t.index ["identification_id"], name: "index_extend_demographies_on_identification_id", using: :btree
    t.index ["user_id"], name: "index_extend_demographies_on_user_id", using: :btree
  end

  create_table "faxes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "fax_number"
    t.integer  "fax_type_id"
    t.integer  "extend_demography_id"
    t.text     "note",                 limit: 65535
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "genders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "identification_number"
    t.boolean  "status"
    t.date     "date_expired"
    t.string   "date_issued"
    t.text     "note",                   limit: 65535
    t.integer  "identification_type_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "extend_demography_id"
    t.integer  "issued_by_type_id"
  end

  create_table "job_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.integer  "department_id"
    t.integer  "role_id"
    t.text     "note",          limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["department_id"], name: "index_job_details_on_department_id", using: :btree
    t.index ["role_id"], name: "index_job_details_on_role_id", using: :btree
    t.index ["user_id"], name: "index_job_details_on_user_id", using: :btree
  end

  create_table "journal_answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.text     "answer",     limit: 65535
    t.integer  "journal_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "journals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "journal_type_id"
    t.text     "question",        limit: 65535
    t.integer  "user_id"
    t.integer  "assigned_to_id"
    t.date     "due_date"
    t.date     "date_completed"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "languages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.integer  "language_type_id"
    t.integer  "proficiency_id"
    t.text     "note",             limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "organizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "address_id"
    t.text     "note",                 limit: 65535
    t.integer  "contact_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "activity_id"
    t.integer  "organization_type_id"
    t.integer  "address_type_id"
    t.integer  "user_id"
  end

  create_table "other_skills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.string   "name"
    t.date     "date_received"
    t.date     "date_expired"
    t.text     "note",          limit: 65535
    t.string   "file"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "phones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "phone_number"
    t.integer  "phone_type_id"
    t.integer  "extend_demography_id"
    t.text     "note",                 limit: 65535
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "positions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "position_description", limit: 65535
    t.string   "location"
    t.string   "special_requirement"
    t.text     "note",                 limit: 65535
    t.date     "date_start"
    t.date     "date_end"
    t.string   "files"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "location_type_id"
    t.integer  "department_id"
    t.string   "salary"
    t.integer  "pay_rate_id"
    t.integer  "employment_type_id"
  end

  create_table "religions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "religion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.boolean  "state"
    t.text     "note",         limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "role_type_id"
    t.text     "permissions",  limit: 65535
  end

  create_table "settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text     "home_page_content", limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "social_media", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "social_media_type_id"
    t.text     "note",                 limit: 65535
    t.string   "social_media_handle"
    t.integer  "extend_demography_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "survey_answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "attempt_id"
    t.integer  "question_id"
    t.integer  "option_id"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_attempts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "participant_type"
    t.integer "participant_id"
    t.integer "survey_id"
    t.boolean "winner"
    t.integer "score"
  end

  create_table "survey_options", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "question_id"
    t.integer  "weight",      default: 0
    t.string   "text"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "survey_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_surveys", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.text     "description",     limit: 65535
    t.integer  "attempts_number",               default: 0
    t.boolean  "finished",                      default: false
    t.boolean  "active",                        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "assigned_to_id"
    t.integer  "survey_type_id"
  end

  create_table "survey_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "assigned_to_id"
    t.integer  "survey_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["assigned_to_id"], name: "index_survey_users_on_assigned_to_id", using: :btree
  end

  create_table "task_notes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.text     "note",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["task_id"], name: "index_task_notes_on_task_id", using: :btree
    t.index ["user_id"], name: "index_task_notes_on_user_id", using: :btree
  end

  create_table "tasks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "title"
    t.text     "description",         limit: 65535
    t.integer  "task_type_id"
    t.integer  "priority_id"
    t.date     "date_start"
    t.date     "date_due"
    t.integer  "user_id"
    t.date     "date_completed"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "assigned_to_id"
    t.integer  "for_individual_id"
    t.integer  "task_status_type_id"
    t.index ["user_id"], name: "index_tasks_on_user_id", using: :btree
  end

  create_table "user_organizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "email",                                default: "",    null: false
    t.string   "login",                                default: "",    null: false
    t.text     "note",                   limit: 65535
    t.boolean  "state",                                default: false
    t.boolean  "admin",                                default: false
    t.string   "encrypted_password",                   default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",                      default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "avatar"
    t.datetime "deleted_at"
    t.string   "provider"
    t.string   "uid"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["deleted_at"], name: "index_users_on_deleted_at", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

  add_foreign_key "emails", "extend_demographies"
  add_foreign_key "extend_demographies", "identifications"
  add_foreign_key "extend_demographies", "users"
  add_foreign_key "job_details", "departments"
  add_foreign_key "job_details", "roles"
  add_foreign_key "job_details", "users"
end
