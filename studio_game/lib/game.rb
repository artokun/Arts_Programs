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
  def print_stats
    @strong_players, @wimpy_players = @players.partition { |player| player.strong?}

    puts "\n#{@title} Statistics"
    puts "\n#{@strong_players.length} strong players:"
    @strong_players.each do |strong|
      puts "#{strong.name} (#{strong.score})"
    end
    puts "\n#{@wimpy_players.length} wimpy players:"
    @wimpy_players.each do |wimpy|
      puts "#{wimpy.name} (#{wimpy.score})"
    end
    @sorted_players = @players.sort{|a,b| b.score <=> a.score}
    puts "\n#{@title} High Scores\n"
    @sorted_players.each do |sorted|
      puts "#{sorted.name.ljust(20,'.')} #{sorted.score}"
    end
  end
  def play(rounds)
    puts "There are #{@players.size} players in #{@title}:"
    @players.each do |player|
      puts player
    end
    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
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
    end    
  end
end

