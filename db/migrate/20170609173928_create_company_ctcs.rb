class CreateCompanyCtcs < ActiveRecord::Migration
  def up
    create_table :company_ctcs do |t|
      t.references :company
      t.string "position",:null=>false
      t.float "ctc",:null=>false
      t.timestamps null: false

    end
add_foreign_key :company_ctcs , :companies,on_delete: :cascade,on_update: :cascade
add_index("company_ctcs","company_id")
  end
  def down
    remove_foreign_key :company_ctcs , :companies
    remove_index("company_ctcs","company_id")
    drop_table :company_ctcs
  end
end
