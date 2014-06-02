# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'treasure_trove'

class Player
  attr_reader :health, :score
  attr_accessor :name
  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end
  def <=>(other)#changed how the space ship operates while sorting players
    other.score <=> score
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
  def found_treasure(treasure)
    #@found_treasures += {treasure.name => treasure.points} < not the right way
    @found_treasures[treasure.name] += treasure.points
    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
    puts "#{@name}'s treasures: #{@found_treasures}'"
  end
  def points
    @found_treasures.values.reduce(0, :+)
  end
  def strong?
    @health > 100
  end
end
if __FILE__ == $0
  player = Player.new('moe')
  puts player.name
  puts player.health
  player.w00t
  puts player.health
  player.blam
  puts player.health
end
