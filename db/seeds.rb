DeviceType.create(name: 'Samsung Audio', controls: Sequel.pg_json([
  {
    type: 'button',
    name: 'Power',
    value: 'off',
    options: ''
  },
  {
    type: 'slider',
    name: 'Volume',
    value: '0',
    options: ''
  },
  {
    type: 'select',
    name: 'Playlist',
    value: 'a',
    options: 'a, b, c'
  }
]))
