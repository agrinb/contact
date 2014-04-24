class CreateUserfiles < ActiveRecord::Migration
  def change
    create_table :userfiles do |t|
      t.string :filename
      t.references :meeting, index: true

      t.timestamps
    end
  end
end
