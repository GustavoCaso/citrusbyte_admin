class UpdateDevices
  def self.call(device_type_id)
    device_type = DeviceType[device_type_id]
    devices = Device.where(device_type_id: device_type_id).all

    # Overwrite or all controls to each device, preserve non modify or thoes with value
    devices.each { |device| update_device_data(device, device_type.controls) }
  end

  def self.update_device_data(device, controls)
    device.update(data: controls.map{ |c| c.merge(value: '') })
  end
end
