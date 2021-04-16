class CreateMoodRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :mood_ratings do |t|
      t.integer "user_id"
      t.integer "rating"
      t.boolean "morning", :default => 0
      t.timestamps
    end
  end
end
