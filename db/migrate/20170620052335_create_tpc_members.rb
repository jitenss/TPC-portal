class CreateTpcMembers < ActiveRecord::Migration
  def change
    create_table :tpc_members do |t|
      t.string "t_roll_no"
      t.string "t_name"
      t.integer "t_batch"
      t.string "team"
      t.date "date_of_joining"
      t.timestamps null: false
    end
    add_index("tpc_members","t_roll_no")

  end

end
