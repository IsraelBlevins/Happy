class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer "commenter_id"
      t.string  "comment"
      t.datetime  "comment_date"
      t.integer      "recipient_ID"
      t.timestamps
    end
  end
end
