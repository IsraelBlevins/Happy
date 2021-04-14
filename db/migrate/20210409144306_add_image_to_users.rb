class AddImageToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :image, :string, :default => "https://i.imgur.com/JVYZerS.jpg"
  end
end
