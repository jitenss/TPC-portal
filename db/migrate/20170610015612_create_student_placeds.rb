class CreateStudentPlaceds < ActiveRecord::Migration
  def change
    create_table :student_placeds do |t|
    	t.references :student_register
    	t.references :company
    	t.integer "ctc", :null=>false
    	t.string "position"
    	t.string "type", :null=>false
		t.timestamps null: false
    end
    #add_index("student_placeds","student_register_id")
    #add_index("student_placeds","company_id")
  end
end
