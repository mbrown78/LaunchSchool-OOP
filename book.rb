class MyCar
    attr_accessor :color
    attr_reader :year

  def initialize(year,model,color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts puts "You push the brake and decelerate #{number} kph."
  end

  def current_speed
    puts "You are now going #{@current_speed} kph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end
end

beatle = MyCar.new(1999,"beatle marque","yellow")
p beatle
beatle.speed_up(20)
beatle.current_speed
beatle.brake(10)
beatle.current_speed
beatle.shut_down
beatle.current_speed
beatle.color= "blue"
beatle
beatle.year
beatle.spray_paint('rainbow')
