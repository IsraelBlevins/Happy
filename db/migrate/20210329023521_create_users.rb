class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer "user_id"
      t.string "full_name" 
      t.string "display_name" 
      t.integer "group_id"
      t.string  "email"
      t.string  "username"
      t.string  "password"
      t.boolean "superUser", :default => 0
      t.timestamps
    end
  end
end
