class AddColulmnToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :name, :string
  end
end
