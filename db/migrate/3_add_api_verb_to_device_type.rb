Sequel.migration do
  up do
    alter_table :device_types do
      add_column :api_verb, String
    end
  end

  down do
    alter_table :device_types do
      drop_column :api_verb
    end
  end
end
