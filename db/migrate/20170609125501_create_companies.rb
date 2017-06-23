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
      t.timestamps null: false
    end
    add_index("companies","cin")
  end
end
