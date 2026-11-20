class AddPictureUrlToLists < ActiveRecord::Migration[8.1]
  def change
        add_column :lists, :picture_url, :string
  end
end
