class GameController < UITabBarController

  def initWithSport(sport)
    @sport = sport
    self.init
    self
  end

  def viewDidLoad
    super

    self.title = @sport.name

    self.viewControllers = 1.upto(3).map do |i|
      period = Period.new(id:i, label:"Period #{i}", is_default:i==2)
      1.upto(30) do |j|
        game = Game.new(status:"Game #{j}")

        game.home_team = Team.new
        game.home_team.name = "Team #{rand(12)}"
        game.home_team.alias = "AL#{rand(12)}"
        game.home_team.score = rand(12)

        game.visiting_team = Team.new
        game.visiting_team.name = "Team #{rand(12)}"
        game.visiting_team.alias = "AL#{rand(12)}"
        game.visiting_team.score = rand(12)

        period.games << game
      end
      @sport.add_period(period)
      PeriodController.alloc.initWithPeriod(period)
    end

    self.selectedIndex = 1
  end

end
