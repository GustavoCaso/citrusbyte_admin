Sequel.migration do
  up do
    create_table(:devices) do
      primary_key :id
      foreign_key :device_type_id, :device_types
      String :name, null: false
      String :ip, null: false
      Json   :data, default: '[]'
    end
  end

  down do
    drop_table(:devices)
  end
end
