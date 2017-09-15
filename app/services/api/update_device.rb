module Api
  class UpdateControlData
    def self.call(old_data, client_data)
      old_data.each_with_object([]) do |d, array|
        control = if d['type'] == client_data['type'] && d['name'] == client_data['name']
                    d.merge('value' => client_data['value'] )
                  else
                    d
                  end
        array << control
      end
    end
  end
end
