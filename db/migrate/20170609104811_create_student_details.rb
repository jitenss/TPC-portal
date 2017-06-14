class CreateStudentDetails < ActiveRecord::Migration
  def change
    create_table :student_details do |t|
    	t.string "s_name" , :null=> false
    	t.integer "batch", :null=> false
    	t.string "roll_no", :null=> false
    	t.string "branch", :null=> false
    	t.string "gender", :null=> false
    	t.date "date_of_birth", :null=> false
    	t.integer "contact_no_1",:null=> false
    	t.integer "contact_no_2"
    	t.string "email", :null=> false
    	t.float "spi_1", :null=> false, :precision=> 4, :scale=> 2
    	t.float "spi_2", :null=> false, :precision=> 4, :scale=> 2
    	t.float "spi_3", :null=> false, :precision=> 4, :scale=> 2
    	t.float "spi_4", :null=> false, :precision=> 4, :scale=> 2
    	t.float "spi_5", :null=> false, :precision=> 4, :scale=> 2
    	t.float "spi_6", :null=> false, :precision=> 4, :scale=> 2
    	t.float "spi_7", :precision=> 4, :scale=> 2
        t.float "cpi_6", :null=> false, :precision=> 4, :scale=> 2
    	t.float "cpi_7", :precision=> 4, :scale=> 2
    	t.float "percent_10", :null=> false, :precision=> 4, :scale=> 2
    	t.float "percent_12", :null=> false, :precision=> 4, :scale=> 2
      	t.timestamps :null=> false
    end
  end
end
