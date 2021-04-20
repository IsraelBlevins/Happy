class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer   "member_id"
      t.string    "commenter"
      t.string    "body"
      t.datetime  "comment_date"
      t.datetime  "comment_time"
      t.integer   "recipient_ID"
      t.timestamps
    end
  end
end
