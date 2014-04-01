class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.datetime :meeting
      t.belongs_to :mycontact

      t.timestamps
    end
  end
end
