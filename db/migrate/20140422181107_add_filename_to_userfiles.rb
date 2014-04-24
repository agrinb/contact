class AddFilenameToUserfiles < ActiveRecord::Migration
  def change
    add_column :userfiles, :filename, :string
  end
end
