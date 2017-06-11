class CreateCompanyCtcs < ActiveRecord::Migration
  def change
    create_table :company_ctcs do |t|
      t.references :company
      t.string "position",:null=>false
      t.float "ctc",:null=>false
      t.timestamps null: false

    end
	add_foreign_key :company_ctcs , :companies,on_delete: :cascade,on_update: :cascade
  end
end
