# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

def say_hello(name, health=100)
  time = Time.now
  "I'm #{name.capitalize} with a health of #{health} as of #{time.strftime("%H:%M:%S")}"
end

puts say_hello("larry", 60)
puts say_hello("curly", 125)
puts say_hello("moe")
puts say_hello("shemp", 90)