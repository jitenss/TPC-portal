class CreateCompanyBranches < ActiveRecord::Migration
  def change
    create_table :company_branches do |t|
      t.references :company
      t.string "branch",:null=>false
      t.timestamps null: false
    end
    add_foreign_key :company_branches , :companies,on_delete: :cascade,on_update: :cascade
  end
end
