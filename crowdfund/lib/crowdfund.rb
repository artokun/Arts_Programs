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
#5. insert a one-time request for funding before funding rounds begin
#6. When funding rounds are over, print out the number of fully funded and underfunded projects
#7. print off a list of projects that still need contributions
#8. make different pledge types, bronze, silver and gold and use those to fund projects
#9. Model the concept of a pledge as a struct with name and amount attributes. Then use the struct
#.. to create three Pledge objects in an array called PLEDGES (a constant) in a PledgePool module.
#10. keep track of pledges using hashes between rounds and accumulate them at the end