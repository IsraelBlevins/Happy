class CreateSliderPictures < ActiveRecord::Migration[6.0]
  def change
    create_table :slider_pictures do |t|
      t.string "image_link"
      t.timestamps
    end
  end
end
