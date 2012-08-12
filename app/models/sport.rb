class Sport
  PROPERTIES = [
    :name
  ]

  PROPERTIES.each { |property|
    attr_accessor property
  }

  def initialize(attributes)
    attributes.each do |key,value|
      self.send("#{key}=", value) if PROPERTIES.member? key
    end
    @periods = []
  end

  def add_period(period)
    @periods << period unless @periods.include? period
    period.sport = @name
  end

end