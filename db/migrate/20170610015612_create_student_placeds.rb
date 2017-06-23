class CreateStudentPlaceds < ActiveRecord::Migration
  def up
    create_table :student_placeds do |t|
    	t.references :student_register
    	t.references :company
    	t.integer "ctc", :null=>false
    	t.string "position"
    	t.string "type", :null=>false
		t.timestamps null: false
    end

    add_foreign_key :student_placeds , :student_registers,on_delete: :cascade,on_update: :cascade
    add_foreign_key :student_placeds , :companies,on_delete: :cascade,on_update: :cascade
    add_index("student_placeds","student_register_id")
    add_index("student_placeds","company_id")

    

  end
  def down
    remove_foreign_key :student_placeds, :student_registers
    remove_foreign_key :student_placeds, :companies
    remove_index :student_placeds, :student_register_id
    remove_index :student_placeds, :company_id
    drop_table :student_placeds

  end
end
