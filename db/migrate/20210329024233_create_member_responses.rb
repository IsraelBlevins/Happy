class CreateMemberResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :member_responses do |t|
      t.integer "member_id"
      t.string  "question_asked", :null =>true
      t.string  "response_type"
      t.string  "response"
      t.datetime "response_date"
      t.boolean   "checked_off", :default => 0
      t.timestamps
    end
  end
end
