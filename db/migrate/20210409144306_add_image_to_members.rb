class AddImageToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :image, :string, :default => "https://i.imgur.com/JVYZerS.jpg"
  end
end
