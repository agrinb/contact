class ChangeCamelCaseFormyContacts < ActiveRecord::Migration
  def change
  	rename_column :mycontacts, :firstName, :first_name
  	rename_column :mycontacts, :lastName, :last_name
  	rename_column :mycontacts, :emailBusiness, :email_business
  	rename_column :mycontacts, :emailPersonal, :email_personal
  	rename_column :mycontacts, :phoneNumber, :phone_number
  	rename_column :mycontacts, :phoneNumber2, :phone_number_2
  end
end
