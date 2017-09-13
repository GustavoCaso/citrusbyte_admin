Sequel.migration do
  up do
    create_table(:controls) do
      primary_key :id
      String :name, null: false
      String :type, null: false
    end
  end

  down do
    drop_table(:controls)
  end
end
