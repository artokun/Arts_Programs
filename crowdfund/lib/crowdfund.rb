# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Fundraiser
  attr_accessor :name
  attr_reader :fund, :goal, :togo
  def initialize(name, fund, goal)
    @name = name.capitalize
    @fund = fund
    @goal = goal
  end
  def togo
    @togo = @goal - @fund
    "#{@name} has $#{@togo} to go before being fully funded!"
  end
  def to_s
    "#{@name} has $#{@fund} in funding towards a goal of $#{@goal}"
  end
  def add_funds(amount)
    @fund = @fund + amount
    puts "#{@name} got more funds!"
  end
  def lost_funds(amount)
    @fund = @fund - amount
    puts "#{@name} lost some funds!"
  end
end

project1 = Fundraiser.new("project LMN", 500, 3000)
project2 = Fundraiser.new("project XYZ", 25, 75)
puts project1
puts project2
project1.lost_funds(25)
project2.add_funds(25)
puts project1
puts project2
puts project1.togo
puts project2.togo

#TODO
#1. create a Project class
#2. finish filling out the rspec testing
#3. use the Die class to determine whether a fundraiser get funds or loses it depending on whether the die is even or odd
#4. create a module called FundingRound, delegating the functions described in #3