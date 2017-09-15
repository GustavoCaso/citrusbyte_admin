samsung_audio = DeviceType.create(name: 'Samsung Audio', controls: Sequel.pg_json([
  {
    type: 'button',
    name: 'Power',
    options: ''
  },
  {
    type: 'slider',
    name: 'Volume',
    options: ''
  },
  {
    type: 'select',
    name: 'Playlist',
    options: 'a,b,c,d'
  }
]))

sony_audio = DeviceType.create(name: 'Sony Audio', controls: Sequel.pg_json([
  {
    type: 'button',
    name: 'Power',
    options: ''
  },
  {
    type: 'slider',
    name: 'Volume',
    options: ''
  },
  {
    type: 'select',
    name: 'Playlist',
    options: 'a,b,c,d'
  }
]))

apple_tv = DeviceType.create(name: 'Apple TV', controls: Sequel.pg_json([
  {
    type: 'button',
    name: 'Power',
    options: ''
  },
  {
    type: 'slider',
    name: 'Brightness',
    options: ''
  },
  {
    type: 'slider',
    name: 'Volumen',
    options: ''
  }
]))

citrus_lights = DeviceType.create(name: 'Citrus Lights', controls: Sequel.pg_json([
  {
    type: 'button',
    name: 'On/Off',
    options: ''
  }
]))

Device.create(name: 'Bedroom Apple TV', ip: '192.168.0.0', device_type_id: apple_tv.id, data: [
  {
    type: 'button',
    name: 'Power',
    options: '',
    value: false
  },
  {
    type: 'slider',
    name: 'Brightness',
    options: '',
    value: 0
  },
  {
    type: 'slider',
    name: 'Volumen',
    options: '',
    value: 0
  }
])
Device.create(name: 'Livingroom Player', ip: '192.168.1.1', device_type_id: samsung_audio.id, data: [
  {
    type: 'button',
    name: 'Power',
    options: '',
    value: false
  },
  {
    type: 'slider',
    name: 'Volume',
    options: '',
    value: 0
  },
  {
    type: 'select',
    name: 'Playlist',
    options: 'a,b,c,d',
    value: 'a'
  }
])
Device.create(name: 'Livingroom Lights', ip: '192.168.2.2', device_type_id: citrus_lights.id, data: [
  {
    type: 'button',
    name: 'On/Off',
    options: '',
    value: false
  }
])
