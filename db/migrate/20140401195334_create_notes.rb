class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :note
      t.belongs_to :mycontact

      t.timestamps
    end
  end
end
