class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string "c_name", :null=> false
      t.float "cpiCriteria", :null=> false, :precision=> 4, :scale=> 2
      t.string "category", :null=> false
      t.text "info"
      t.string "backlogs",:null=> false
      t.text "skills_set"
      t.timestamps null: false
    end
  end
end
