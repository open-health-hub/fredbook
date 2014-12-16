json.array!(@preferences) do |preference|
  json.extract! preference, :id, :care_data_privacty_setting
  json.url preference_url(preference, format: :json)
end
