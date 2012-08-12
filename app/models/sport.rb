class Sport
  include Properties

  properties :name, :periods

  def initialize(attributes={})
    init_attributes(attributes)
    @periods = []
  end

  def add_period(period)
    @periods << period unless @periods.include? period
    period.sport = @name
  end

end