
class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end

  def fetch
    'fetching!'
  end

end

#Create a sub-class from Dog called Bulldog overriding the swim method to return "can't swim!"

class Bulldog < Dog
  def swim
   "can't swim"
  end
end

class Cat < Dog
  def swim
    "can't swim"
  end

  def fetch
    "umm im a cat.Nope"
  end

end
#Create a new class called Cat, which can do everything a dog can, except swim or fetch. Assume the methods do the exact same thing. Hint: don't just copy and paste all methods in Dog into Cat; try to come up with some class hierarchy.

#teddy = Dog.new
#puts teddy.speak           # => "bark!"
#puts teddy.swim

#bull = Bulldog.new
#puts bull.speak
#puts bull.swim

kitty = Cat.new
puts kitty.speak
puts kitty.swim
puts kitty.run
puts kitty.jump
puts kitty.fetch
