require 'rspec'
require_relative 'game'

describe Game do

  before do
    @game = Game.new('Knuckleheads')

    @initial_health = 100
    @player = Player.new('moe', @initial_health)

    @game.add_player(@player)
  end

  it 'it w00ts the player if a high number is rolled' do
    Die.any_instance.stub(:roll).and_return(5)

    @game.play(2)

    @player.health.should == @initial_health + (15 * 2)
  end

  it 'it skips the player if a medium number is rolled' do
    Die.any_instance.stub(:roll).and_return(3)

    @game.play(2)

    @player.health.should == @initial_health
  end

  it 'it blamms the player if a low number is rolled' do
    Die.any_instance.stub(:roll).and_return(1)

    @game.play(2)

    @player.health.should == @initial_health - (10 * 2)
  end

  it "assigns a treasure for points during a player's turn" do
    game = Game.new("Knuckleheads")
    player = Player.new("moe")

    game.add_player(player)

    game.play(1)

    player.points.should_not be_zero

    # or use alternate expectation syntax:
    # expect(player.points).not_to be_zero
  end

  it 'computes total points as the sum of all player points' do
    game = Game.new("Knuckleheads")

    player1 = Player.new("moe")
    player2 = Player.new("larry")

    game.add_player(player1)
    game.add_player(player2)

    player1.found_treasure(Treasure.new(:hammer, 50))
    player1.found_treasure(Treasure.new(:hammer, 50))
    player2.found_treasure(Treasure.new(:crowbar, 400))

    game.total_points.should == 500
  end
  it "yields each found treasure and its total points" do
    @player.found_treasure(Treasure.new(:skillet, 100))
    @player.found_treasure(Treasure.new(:skillet, 100))
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))

    yielded = []
    @player.each_found_treasure do |treasure|
      yielded << treasure
    end

    yielded.should == [
        Treasure.new(:skillet, 200),
        Treasure.new(:hammer, 50),
        Treasure.new(:bottle, 25)
    ]
  end
end