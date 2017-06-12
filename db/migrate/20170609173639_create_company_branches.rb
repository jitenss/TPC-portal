class CreateCompanyBranches < ActiveRecord::Migration
  def up
    create_table :company_branches do |t|
    t.references :company
      t.string "branch",:null=>false
      t.timestamps null: false
    end
    add_foreign_key :company_branches , :companies,on_delete: :cascade,on_update: :cascade
    add_index("company_branches","company_id")
  end
  def down
    remove_foreign_key :company_branches , :companies
    remove_index("company_branches","company_id")
    drop_table :company_branches
  end
end
