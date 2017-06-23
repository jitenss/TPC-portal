class CreateCompanyDrives < ActiveRecord::Migration
  def up
    create_table :company_drives do |t|
      t.references :company
      t.date "start_date", null: false
      t.date "end_date"
      t.integer "no_placed_students"
      t.text "feedback"
      t.timestamps null: false
    end
   add_foreign_key :company_drives , :companies,on_delete: :cascade,on_update: :cascade
   add_index("company_drives","company_id")
  end

  def down
    remove_foreign_key :company_drives , :companies
    remove_index("company_drives","company_id")
    drop_table :company_drives
  end
end
