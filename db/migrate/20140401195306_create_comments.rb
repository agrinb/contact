class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :mycontact
      t.string :comment

      t.timestamps
    end
  end
end
