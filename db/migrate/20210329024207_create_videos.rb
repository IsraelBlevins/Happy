class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string "video_link"
      t.datetime "upload_date"
      t.string  "uploader_comment"
      t.timestamps
    end
  end
end
