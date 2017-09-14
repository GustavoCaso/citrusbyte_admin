Sequel.migration do
  up do
    create_table(:device_types) do
      primary_key :id
      String :name, null: false
      String :api_url
      Json   :controls, default: '[]'
    end
  end

  down do
    drop_table(:device_types)
  end
end
