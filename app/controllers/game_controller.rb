class GameController < UITabBarController

  def initWithSport(sport)
    @sport = sport
    self.init

    # TODO load new controllers for each period in the sport
    # TODO figure out why the tabs don't show up until clicked
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