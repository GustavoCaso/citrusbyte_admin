class Control
  attr_accessor :name, :value, :options
  def initialize(name, value, options=[])
    @name = name
    @value = value
    @options = options
  end
end

Button = Control.new('button', '')
Slider = Control.new('slider', '')
Select = Control.new('select', '')

def controls_list
  [
    Button,
    Slider,
    Select
  ]
end
