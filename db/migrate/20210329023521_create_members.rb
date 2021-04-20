class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.integer "member_id"
      t.string "display_name" 
      t.integer "group_id"
      t.string  "email"
      t.string  "password"
      t.boolean "superUser", :default => 0
      t.timestamps
    end
  end
end
