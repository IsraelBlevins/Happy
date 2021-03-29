class CreateUserResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_responses do |t|
      t.integer "user_id"
      t.string  "question_asked", :null =>true
      t.string  "response_type"
      t.string  "response"
      t.datetime "response_date"
      t.timestamps
    end
  end
end
