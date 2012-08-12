class Game
  include Properties

  properties :status

  def initialize(attributes={})
    init_attributes(attributes)
  end

end