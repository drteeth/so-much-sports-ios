class Period

  attr_accessor :id, :label, :is_default, :sport, :games

  def initialize(attributes)
    attributes.each do |key,value|
      self.send("#{key}=",value)
    end

    # fake some games
    @games = 15.times.map { |i| Game.new("Game #{i}") }
  end

end