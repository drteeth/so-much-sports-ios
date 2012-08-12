class GameController < UITabBarController

  def initWithSport(sport)
    @sport = sport
    self.init

    self.viewControllers = 1.upto(3).map do |i|
      period = Period.new(id:i, label:"Period #{i}", is_default:i==2)
      @sport.add_period(period)
      PeriodController.alloc.initWithPeriod(period)
    end

    self
  end

  def viewDidLoad
    super

    self.title = @sport.name
  end

end