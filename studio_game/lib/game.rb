# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'
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
    @strong_players.each do |player|
      print_name_and_health(player)
    end
    puts "\n#{@wimpy_players.length} wimpy players:"
    @wimpy_players.each do |player|
      print_name_and_health(player)
    end
    @players.sort.each do |player|
      puts "\n#{player.name}'s points totals:"
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.points} grand total points"
    end
    puts "\nHigh Scores:"
    @players.sort.each do |player|
      formatted_name = player.name.ljust(20, '.')
      puts "#{formatted_name} #{player.score}"
    end
    puts "\n#{total_points} total points from treasures found"
  end
  def total_points
    total_points = Array.new
    @players.sort.each do |player|
      points = player.points
      total_points.push (points)
    end
    total_points.reduce(0, :+)
    #OR BETTER: @players.reduce(0) { |sum, player| sum + player.points }
  end
  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end
  def play(rounds)
    puts "There are #{@players.size} players in #{@title}:"
    @players.each do |player|
      puts player
    end
    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.size} treasures to be found\n"
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end
    1.upto(rounds) do |round|
      if block_given?
        break if yield
      end
      puts "\nRound #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)
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

