class CreateStudentRegisters < ActiveRecord::Migration
  def up
    create_table :student_registers do |t|
    	t.references :student_detail
    	t.references :company
      	t.timestamps null: false
    end

    add_foreign_key :student_registers , :student_details,on_delete: :cascade,on_update: :cascade
    add_foreign_key :student_registers , :companies,on_delete: :cascade,on_update: :cascade
    add_index("student_registers","student_detail_id")
    add_index("student_registers","company_id")

    

  end
  def down
    remove_foreign_key :student_registers, :student_details
    remove_foreign_key :student_registers, :companies
    remove_index :student_registers, :student_detail_id
    remove_index :student_registers, :company_id
    drop_table :student_registers
  end

end
