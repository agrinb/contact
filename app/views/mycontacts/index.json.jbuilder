json.array!(@mycontacts) do |mycontact|
  json.extract! mycontact, :id, :firstName, :lastName, :emailBusiness, :emailPersonal
  json.url mycontact_url(mycontact, format: :json)
end
