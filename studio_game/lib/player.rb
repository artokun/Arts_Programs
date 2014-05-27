# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Player
  attr_reader :health, :score
  attr_accessor :name
  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end
  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}."
  end
  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end
  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end
  def score
    @score = @name.length + @health
  end
end
if __FILE__ == $0
  player = Player.new("moe")
  puts player.name
  puts player.health
  player.w00t
  puts player.health
  player.blam
  puts player.health
end
