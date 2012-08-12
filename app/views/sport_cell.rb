class SportCell < UITableViewCell

  attr_accessor :col1, :col2

  def initWithStyle(style, reuseIdentifier:reuseIdentifier)
    if super
      icon_size = 128
      size = self.contentView.bounds.size
      cell_width = size.width / 2
      left_padding = (cell_width - icon_size) / 2

      @col1 = UIButton.buttonWithType(UIButtonTypeCustom)
      @col1.frame = [[left_padding,left_padding], [icon_size, icon_size]]

      @col2 = UIButton.buttonWithType(UIButtonTypeCustom)
      @col2.frame = [[cell_width + left_padding,left_padding], [icon_size, icon_size]]

      self.contentView.addSubview(@col1)
      self.contentView.addSubview(@col2)
    end
    self
  end

end