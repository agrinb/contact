class CreateUploadedfiles < ActiveRecord::Migration
  def change
    create_table :uploadedfiles do |t|
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end
