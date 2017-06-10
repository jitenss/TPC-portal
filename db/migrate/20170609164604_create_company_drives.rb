class CreateCompanyDrives < ActiveRecord::Migration
  def change
    create_table :company_drives do |t|
      t.references :company
      t.date "start_date" null: false
      t.date "end_date" 
      t.integer "no_placed_students" null: false
      t.text "feedback"
      t.timestamps null: false
    end
   add_foreign_key :company_drives , :companies,on_delete: :cascade,on_update: :cascade
  end
end
