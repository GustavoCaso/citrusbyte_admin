class DeviceType < Sequel::Model
  one_to_one :devices
end
