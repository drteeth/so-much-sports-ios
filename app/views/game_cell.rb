class GameCell < UITableViewCell

  attr_accessor :home_team_icon, :home_team_score, :home_team_name,
                :visiting_team_icon, :visiting_team_score, :visiting_team_name,
                :status

  def initWithStyle(style, reuseIdentifier:reuseIdentifier)
    if super
      icon_size = 128 # TODO DRY this up
      size = self.contentView.bounds.size
      cell_width = size.width / 2
      left_padding = (cell_width - icon_size) / 2

      # @home_team_icon = UIButton.buttonWithType(UIButtonTypeCustom)
      # @home_team_icon.frame = [[left_padding,left_padding], [icon_size, icon_size]]

      # @visiting_team_icon = UIButton.buttonWithType(UIButtonTypeCustom)
      # @visiting_team_icon.frame = [[cell_width + left_padding,left_padding], [icon_size, icon_size]]

      w = 320
      # @home_team_score = UILabel.alloc.initWithFrame([[0,0],[40,80]])
      # @home_team_name = UILabel.alloc.initWithFrame([[80,0],[40,80]])
      # @visiting_team_score = UILabel.alloc.initWithFrame([[160,0],[40,80]])
      # @visiting_team_name = UILabel.alloc.initWithFrame([[240,0],[40,80]])

      # h = self.contentView.frame.size.height
      @status = UILabel.alloc.initWithFrame([[0,0],[320, 20]])
      self.contentView.addSubview(@status)
      # self.contentView.addSubview(@home_team_score)
      # self.contentView.addSubview(@home_team_name)
      # self.contentView.addSubview(@visiting_team_score)
      # self.contentView.addSubview(@visiting_team_name)
    end
    self
  end

end