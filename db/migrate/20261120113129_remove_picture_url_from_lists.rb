class RemovePictureUrlFromLists < ActiveRecord::Migration[8.1]
  def change
    remove_column :lists, :picture_url, :string
  end
end
