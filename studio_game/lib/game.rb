# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
class Game
  attr_reader :title
  def initialize(title)
    @title = title
    @players = []
  end
  def add_player(player)
    @players<<(player)
  end
  def play
    puts "There are #{@players.size} players in #{@title}:"
    @players.each do |player|
      puts player
    end
    @players.each do |player|
      GameTurn.take_turn(player)
=begin
      die = Die.new
      number_rolled = die.roll

      if number_rolled < 3
        player.blam
      elsif number_rolled < 5
      puts "#{player.name} was skipped"
      else
        player.w00t
      end
=end
      puts player
    end    
  end
end

