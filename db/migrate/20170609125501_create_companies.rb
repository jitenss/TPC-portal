class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string "cin", :null=>false
      t.string "c_name", :null=> false
      t.float "cpiCriteria", :null=> false, :precision=> 4, :scale=> 2
      t.string "category", :null=> false
      t.integer "batch"
      t.text "info"
      t.integer "c_backlogs",:null=> false
      t.text "skills_set"
      t.boolean "visiting",:default=>false
      t.date "start_date"
      t.date "end_date"
      t.integer "no_placed_students"
      t.text "feedback"
      t.timestamps null: false
    end
    add_index("companies","c_name")
  end
end
