class Team
  include Properties

  properties :id, :name, :score

  def initialize(attributes={})
    init_attributes(attributes)
    @score ||= 0
  end

end