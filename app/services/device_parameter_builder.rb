class DeviceParameterBuilder
  def self.call(params)
    device_type = fetch_device_type(params['device_type_id'])
    {
      name: params['name'],
      ip: params['ip'],
      device_type_id: params['device_type_id'],
      data: device_type.controls.map { |control| control.merge(value: '') }
    }
  end

  def self.fetch_device_type(id)
    DeviceType[id]
  end
end
