class SportCell < UITableViewCell

  attr_accessor :col1, :col2

  def initWithStyle(style, reuseIdentifier:reuseIdentifier)
    if super
      size = self.contentView.bounds.size

      # TODO DRY up magic number 128
      @col1 = UIImageView.alloc.initWithFrame([[0,0], [128, 128]])
      @col2 = UIImageView.alloc.initWithFrame([[size.width/2,0], [128, 128]])
      self.contentView.addSubview(@col1)
      self.contentView.addSubview(@col2)
    end
    self
  end

end