class GameController < UITabBarController

  def initWithSport(sport)
    @sport = sport
    self.init
    self
  end

  def viewDidLoad
    super

    self.title = @sport.name

    # TODO load new controllers for each period in the sport
    # TODO figure out why the tabs don't show up until clicked
    self.viewControllers = 1.upto(3).map do |i|
      period = Period.new(id:i, label:"Period #{i}", is_default:i==2)
      1.upto(30) do |j|
        game = Game.new(status:"Game #{j}")
        game.home_team = Team.new
        game.home_team.name = "Team #{j}"
        game.home_team.score = 0
        period.games << game
      end
      @sport.add_period(period)
      PeriodController.alloc.initWithPeriod(period)
    end
  end

end
