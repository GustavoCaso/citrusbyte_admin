class DevicePresenter
  def self.call(device)
    device_type = device.device_type
    rest_call_info = { api_verb: device_type.api_verb, api_url: device_type.api_url }
    device.values.merge(rest_call_info)
  end
end
