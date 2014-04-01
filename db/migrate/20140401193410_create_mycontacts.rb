class CreateMycontacts < ActiveRecord::Migration
  def change
    create_table :mycontacts do |t|
      t.belongs_to :user
      t.string :firstName
      t.string :lastName
      t.string :emailBusiness
      t.string :emailPersonal
      t.string :phoneNumber
      t.string :phoneNumber2
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.date :date
      t.timestamps
    end
  end
end
