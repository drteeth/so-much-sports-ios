class Period
  include Properties

  properties :id, :label, :is_default, :sport, :games

  def initialize(attributes={})
    init_attributes(attributes)
    @games ||= []
  end

end