class CreateStudentRegisters < ActiveRecord::Migration
  def change
    create_table :student_registers do |t|
    	t.references :student_detail
    	t.references :company
      	t.timestamps null: false
    end
    #add_index("student_registers","student_detail_id")
    #add_index("student_registers","company_id")
  end
end
