class AddImageToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :image, :string, :default => "https://t4.ftcdn.net/jpg/03/32/59/65/240_F_332596535_lAdLhf6KzbW6PWXBWeIFTovTii1drkbT.jpg"
  end
end
