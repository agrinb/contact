class FileNameSlug < ActiveRecord::Migration
  def change
    add_column :userfiles, :file_name_slug, :string
  end
end
