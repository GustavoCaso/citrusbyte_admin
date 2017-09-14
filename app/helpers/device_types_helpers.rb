def device_types_select_value
  DeviceType.select_map([:name, :id])
end
