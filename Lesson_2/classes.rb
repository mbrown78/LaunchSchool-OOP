class Person
  attr_accessor :first_name :last_nameß

  def initialize(full_name)
    @name = name
    @first_name = first_name
    @last_name = last_name
  end
end


bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
p bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'
