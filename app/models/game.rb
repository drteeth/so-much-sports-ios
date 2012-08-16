class Game
  include Properties

  properties :status, :home_team, :visiting_team

  def initialize(attributes={})
    init_attributes(attributes)
  end

end